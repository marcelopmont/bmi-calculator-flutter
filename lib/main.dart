import 'package:bmi_calculator/pages/results_page.dart';

import 'pages/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/results': (context) {
          Map arguments = ModalRoute.of(context).settings.arguments as Map;
          return ResultsPage(
            resultBMI: arguments['resultBMI'],
            resultTitle: arguments['resultTitle'],
            resultDetails: arguments['resultDetails'],
          );
        }
      },
    );
  }
}
