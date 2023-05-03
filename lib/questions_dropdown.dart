import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'game_model.dart';

List<int> questions = [4, 5, 6];

class QuestionDropDown extends StatelessWidget {
  const QuestionDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final gameModel = Provider.of<GameModel>(context);
    return Column(children: [
      SizedBox(
          height: 48,
          width: MediaQuery.of(context).size.width * 0.15,
          child: DropdownButton(
            isExpanded: true,
            items: questions.map((q) {
              return DropdownMenuItem(
                value: q,
                child: Text(q.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              );
            }).toList(),
            value: gameModel.questions,
            onChanged: (value) {
              if (value != null) {
                gameModel.setQuestions(value);
              }
            },
            dropdownColor: Colors.blue,
            focusColor: const Color.fromARGB(255, 10, 64, 182),
          ))
    ]);
  }
}
