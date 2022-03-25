import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/model/car_model.dart';

class CarStateNotifier extends StateNotifier<Car> {
  CarStateNotifier() : super(const Car());

  void setDoors(int doors) {
    final newState = state.copy(doors: doors);
    state = newState;
  }
 
  void increaseSpeed() {
    final speed = state.speed + 5;
    final newState = state.copy(speed: speed);
    state = newState;
  }

  void hitBrake() {
    final speed = max(0, state.speed - 30);
    final newState = state.copy(speed: speed);
    state = newState;
  }

}