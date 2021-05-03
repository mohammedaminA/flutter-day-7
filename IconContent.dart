import 'package:flutter/material.dart';
import 'constants.dart';

class GenderChildCard extends StatelessWidget {
  final String text;
  final IconData icon;



  GenderChildCard({this.text,this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kTextStyle
        ),
      ],
    );
  }
}
