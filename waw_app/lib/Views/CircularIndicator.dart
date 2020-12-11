import 'package:flutter/material.dart';
import 'package:waw_app/Utility/Constants.dart';

class CircularIndicator extends StatelessWidget {
  final double percentage;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color strokeColor;

  CircularIndicator({
    @required this.width,
    @required this.height,
    this.percentage,
    this.backgroundColor,
    this.strokeColor = kPRIMARY_COLOR,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CircularProgressIndicator(
        backgroundColor: backgroundColor ?? Color.fromRGBO(227, 207, 235, 1.0),
        valueColor: AlwaysStoppedAnimation<Color>(strokeColor),
        strokeWidth: 6,
        value: percentage,
      ),
    );
  }
}
