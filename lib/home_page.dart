import 'package:flutter/material.dart';
import 'package:flutterdy/settings_page.dart';
import 'game_board.dart';

class DrawerItem {
  String title;
  IconData icon;
  Color color;
  DrawerItem(this.title, this.icon, this.color);
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final drawerItems = [
    DrawerItem("Game Board", Icons.home, Colors.blue),
    DrawerItem("Settings", Icons.settings, Colors.amber),
  ];

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int index) {
    switch (index) {
      case 0:
        return const GameBoard();
      case 1:
        return const SettingsPage();
      default:
        return const Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(ListTile(
        leading: Icon(d.icon),
        title: Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return Scaffold(
      appBar: AppBar(
          // here we display the title corresponding to the fragment
          // you can instead choose to have a static title
          title: Text(widget.drawerItems[_selectedDrawerIndex].title),
          backgroundColor: widget.drawerItems[_selectedDrawerIndex].color),
      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: Column(
          children: <Widget>[
            const SizedBox(
                height: 64,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Game Menu'),
                )),
            // const UserAccountsDrawerHeader(accountName: Text("John Doe"), accountEmail: null),
            Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
