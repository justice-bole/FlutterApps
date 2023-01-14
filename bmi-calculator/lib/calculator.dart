import 'package:flutter/material.dart';

class Calculator {
  int height;
  int weight;
  double bmi;

  Calculator({@required this.height, @required this.weight});

  void calculateBMI() {
    bmi = weight / (height * height) * 703;
  }

  String weightClass() {
    if (bmi > 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Ideal Weight';
    } else {
      return 'Underweight';
    }
  }

  String description() {
    if (bmi > 25) {
      return 'You\'re considered to be overweight.';
    } else if (bmi > 18.5) {
      return 'You\'re considered to be at the optimal weight for your size.';
    } else {
      return 'You\'re considered to be underweight.';
    }
  }
}
