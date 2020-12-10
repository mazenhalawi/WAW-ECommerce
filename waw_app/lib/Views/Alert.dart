import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alert {
  String title;
  String content;
  List<CupertinoDialogAction> actions;
  BuildContext context;

  Alert(
      {@required this.context,
      @required this.title,
      @required this.content,
      this.actions});

  Future<dynamic> show() async {
    List<CupertinoDialogAction> defaultActions = [];
    if (actions == null) {
      defaultActions.add(CupertinoDialogAction(
        child: Text('Ok'),
        onPressed: () {
          Navigator.pop(context, false);
          return;
        },
      ));
    } else {
      defaultActions = actions;
    }

    CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: defaultActions,
    );

    await showDialog(context: context, child: alert);
  }
}
