import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_model.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    final gameModel = Provider.of<GameModel>(context);
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 3,
      padding: EdgeInsets.zero,
      crossAxisCount: gameModel.categories.length,
      children: List.generate(
          gameModel.categories.length,
          (index) => Text(
                gameModel.categories[index],
                style: const TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              )),
    );
  }
}
