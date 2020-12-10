import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Spinner extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final double backgroundOpacity;
  final bool dismissable;
  final bool isVisible;

  Spinner(
      {@required this.isVisible,
      this.child,
      this.backgroundColor = Colors.black,
      this.backgroundOpacity = 0.6,
      this.dismissable = false});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: backgroundColor,
      inAsyncCall: isVisible,
      opacity: backgroundOpacity,
      dismissible: dismissable,
      child: child,
    );
  }
}
