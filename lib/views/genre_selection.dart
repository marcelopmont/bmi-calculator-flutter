import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class GenreSelection extends StatelessWidget {
  GenreSelection({@required this.icon, @required this.description});

  final IconData icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          this.icon,
          size: 60.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          this.description,
          style: kSimpleTextStyle,
        )
      ],
    );
  }
}