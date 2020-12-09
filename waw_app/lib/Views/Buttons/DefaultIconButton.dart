import 'package:flutter/material.dart';
import 'package:waw_app/Views/Buttons/ButtonContainer.dart';

class DefaultIconButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Widget prefixIcon;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;

  DefaultIconButton({
    @required this.onPressed,
    this.title,
    this.prefixIcon,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.black45,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ButtonContainer(
            backgroundColor: backgroundColor,
            borderColor: borderColor,
            borderWidth: borderWidth,
            child: FlatButton.icon(
              label: Text(
                title,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              icon: Container(
                width: 40,
                height: 40,
                child: prefixIcon,
              ),
              onPressed: onPressed,
            ),
          ),
        ),
      ],
    );
  }
}
