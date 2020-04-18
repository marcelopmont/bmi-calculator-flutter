import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color, this.cardChild});

  final Color color;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.cardChild,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      margin: EdgeInsets.all(15.0),
      height: 150.0,
    );
  }
}