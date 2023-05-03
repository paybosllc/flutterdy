import 'package:flutter/material.dart';
import 'package:flutterdy/score_row.dart';
import 'package:flutterdy/title_row.dart';
import 'package:provider/provider.dart';

import 'button_grid.dart';
import 'game_model.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final gameModel = Provider.of<GameModel>(context, listen: false);
    return Column(children: <Widget>[
      const SizedBox(
        height: 20,
      ),
      const TitleRow(),
      ButtonGrid(
        key: UniqueKey(),
        titles: gameModel.categories,
        questions: gameModel.questions,
      ),
      const SizedBox(height: 20),
      const ScoreRow(),
    ]);
  }
}
