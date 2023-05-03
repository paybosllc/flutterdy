import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_model.dart';

class ToggleCell extends StatefulWidget {
  const ToggleCell({Key? key, required this.value}) : super(key: key);
  final int value;

  @override
  _ToggleCellState createState() => _ToggleCellState();
}

class _ToggleCellState extends State<ToggleCell> {
  bool hide = false;
  bool teamASelected = false;
  bool teamBSelected = false;
  _ToggleCellState();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: !hide,
          child: TextButton(
              onPressed: () {
                setState(() {
                  hide = !hide;
                });
              },
              child: Text(
                widget.value.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 54,
                ),
                textAlign: TextAlign.center,
              )),
        ),
        Visibility(
            visible: hide,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: teamBSelected
                        ? null
                        : () {
                            setState(() {
                              teamASelected = !teamASelected;
                            });
                            final gameModel = Provider.of<GameModel>(context, listen: false);
                            int currentScore = gameModel.scoreTeamA;
                            currentScore += teamASelected ? widget.value : -widget.value;
                            gameModel.setScoreTeamA(currentScore);
                          },
                    child: const Text(
                      'A',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                      textAlign: TextAlign.center,
                    )),
                const SizedBox(width: 8),
                ElevatedButton(
                    onPressed: teamASelected
                        ? null
                        : () {
                            setState(() {
                              teamBSelected = !teamBSelected;
                            });
                            final gameModel = Provider.of<GameModel>(context, listen: false);
                            int currentScore = gameModel.scoreTeamB;
                            currentScore += teamBSelected ? widget.value : -widget.value;
                            gameModel.setScoreTeamB(currentScore);
                          },
                    child: const Text(
                      'B',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ],
            ))
      ],
    );
  }
}
