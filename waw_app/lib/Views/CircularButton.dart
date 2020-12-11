import 'package:flutter/material.dart';
import 'package:waw_app/Utility/Constants.dart';

class CircularButton extends StatelessWidget {
  final Function onPressed;
  final double radius;
  final Widget icon;

  CircularButton(
      {@required this.icon, this.radius = 10, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: kPRIMARY_COLOR,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: IconButton(
            icon: icon,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
