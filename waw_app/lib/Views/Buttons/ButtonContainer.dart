import 'package:flutter/material.dart';
import 'package:waw_app/Utility/Constants.dart';

class ButtonContainer extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final MaterialButton child;

  ButtonContainer({
    @required this.child,
    this.backgroundColor,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(kBUTTON_RADIUS),
        border: Border.all(
          color: borderColor,
          width: borderWidth,
          style: BorderStyle.solid,
        ),
      ),
      child: child,
    );
  }
}
