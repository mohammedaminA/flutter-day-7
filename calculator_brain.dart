import 'package:flutter/cupertino.dart';
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({@required this.height, @required this.weight});

  final double height;
  final int weight;

  double _bmi;

  String calculateBMI() {
     _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if(_bmi>= 25) {
      return 'Overweight';
    }
    else if (_bmi > 18.5) {
      return 'Normal';
    }
    else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if(_bmi>= 25) {
      return 'You should really cut down on some calories';
    }
    else if (_bmi > 18.5) {
      return 'You are healthy as can be! Optimal';
    }
    else {
      return 'Try eating more fam!';
    }
  }
  }
