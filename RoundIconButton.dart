import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.ontap});

  final IconData icon;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      elevation: 6.0,
      fillColor: Color(0XFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      onPressed: ontap,
    );
  }
}
