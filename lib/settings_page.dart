import 'package:flutter/material.dart';
import 'package:flutterdy/edit_categories.dart';
import 'package:flutterdy/questions_dropdown.dart';
import 'package:provider/provider.dart';
import 'game_model.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameModel = Provider.of<GameModel>(context, listen: false);
    gameModel.clearScores();
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('Questions:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
        SizedBox(height: 24),
        QuestionDropDown(),
        SizedBox(height: 24),
        Text('Categories:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
        SizedBox(height: 24),
        EditCategories(),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  gameModel.addCategory();
                },
                child: const Text("+")),
            const SizedBox(width: 40),
            ElevatedButton(
                onPressed: () {
                  gameModel.removeCategory();
                },
                child: const Text("-")),
          ],
        ),
      ],
    ));
  }
}
