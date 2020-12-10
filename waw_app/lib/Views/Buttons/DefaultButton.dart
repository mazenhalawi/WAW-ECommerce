import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waw_app/Utility/Constants.dart';
import 'package:waw_app/Views/Buttons/ButtonContainer.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;

  DefaultButton({
    @required this.onPressed,
    this.title,
    this.backgroundColor,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      borderColor: borderColor,
      borderWidth: borderWidth,
      child: FlatButton(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: kBUTTON_TEXT_SIZE,
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
