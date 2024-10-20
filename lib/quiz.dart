import 'dart:math';

import 'package:rev/question.dart';

class Quiz {
  int i = 0;
  List<Question> arr = [
    Question('The earth is flat.', false),
    Question('Flutter is used for mobile development.', true),
    Question('Birds can fly underwater.', false),
    Question('Dart is the programming language used in Flutter.', true),
  ];

  bool isfinished() {
    if (i == arr.length - 1) return true;

    return false;
  }

  void reset() {
    i = 0;
  }

  void next() {
    if (i < arr.length) i++;
  }

  void pre() {
    if (i > 0) i--;
  }

  String getq() {
    return arr[i].questionText;
  }

  bool geta() {
    return arr[i].answer;
  }

  void shuffle() {
    arr.shuffle(Random());
  }
}
