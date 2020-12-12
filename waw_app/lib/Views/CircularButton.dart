import 'package:flutter/material.dart';
import 'package:waw_app/Utility/Constants.dart';

class CircularButton extends StatelessWidget {
  final Function onPressed;
  final double radius;
  final Widget icon;
  final Color backgroundColor;

  CircularButton(
      {@required this.icon,
      this.radius = 10,
      @required this.onPressed,
      this.backgroundColor = kPRIMARY_COLOR});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
