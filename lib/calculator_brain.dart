
import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({this.weight, this.height}) {
    _bmi = this.weight / pow(this.height / 100, 2);
  }

  final double weight;
  final double height;

  double _bmi;

  String getBMIResult() {
    return _bmi.toStringAsFixed(1);
  }

  String getResultTitle() {
    if(_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getResultDetails() {
    if(_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }


}