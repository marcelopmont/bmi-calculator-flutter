import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {

  RoundedIconButton({this.icon, this.onPressed});

  final Icon icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      child: icon,
      shape: CircleBorder(),
      onPressed: onPressed,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        height: 40.0,
        width: 40.0,
      ),
    );
  }
}