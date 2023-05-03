import 'package:flutter/material.dart';
import 'toggle_cell.dart';

const int questions = 5;

class ButtonGrid extends StatelessWidget {
  const ButtonGrid({super.key, required this.titles, required this.questions});
  final List<String> titles;
  final int questions;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: titles.length,
        crossAxisSpacing: 2,
        mainAxisSpacing: 10,
        childAspectRatio: 3,
        children: List.generate(titles.length * questions, (index) {
          int score = ((index / titles.length).truncate() + 1) * 200;
          return ToggleCell(value: score);
        }));
  }
}
