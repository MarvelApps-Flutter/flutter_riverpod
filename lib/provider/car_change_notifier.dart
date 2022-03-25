import 'dart:math';

import 'package:flutter/material.dart';

class CarChangeNotifier extends ChangeNotifier {
  int speed = 120;

  void increase() {
    speed += 5;

    notifyListeners();
  }

  void hitBreak() {
    speed = max(0, speed - 30);

    notifyListeners();
  }
}