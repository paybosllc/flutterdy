import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_model.dart';

class EditCategories extends StatelessWidget {
  const EditCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final gameModel = Provider.of<GameModel>(context);
    List<String> categories = gameModel.categories;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
          children: List.generate(
              gameModel.categories.length,
              (index) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                      controller: TextEditingController(text: categories[index]),
                      onChanged: (value) => {categories[index] = value, gameModel.categories = categories},
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ))))),
    );
  }
}
