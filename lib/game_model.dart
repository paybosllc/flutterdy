import 'package:flutter/foundation.dart';

class GameModel extends ChangeNotifier {
  int scoreTeamA = 0;
  void setScoreTeamA(int value) {
    scoreTeamA = value;
    notifyListeners();
  }

  int scoreTeamB = 0;
  void setScoreTeamB(int value) {
    scoreTeamB = value;
    notifyListeners();
  }

  void clearScores() {
    scoreTeamA = 0;
    scoreTeamB = 0;
  }

  int questions = 5;
  void setQuestions(int value) {
    questions = value;
    notifyListeners();
  }

  List<String> categories = <String>[
    'Title 1',
    'Title 2',
    'Title 3',
    'Title 4',
    'Title 5',
  ];

  void setCategories(List<String> value) {
    categories = value;
    notifyListeners();
  }

  void removeCategory() {
    categories.removeLast();
    notifyListeners();
  }

  void addCategory() {
    String s = "Title ${categories.length + 1}";
    categories.add(s);
    notifyListeners();
  }
}
