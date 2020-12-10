import 'package:flutter/material.dart';
import 'package:waw_app/Utility/Constants.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function onTap;

  DrawerTile({@required this.title, this.isSelected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.phone),
      title: Text(title),
      trailing: isSelected ? highlightedCircle() : null,
      onTap: onTap,
    );
  }

  Widget highlightedCircle() {
    return CircleAvatar(
      radius: 10,
      backgroundColor: kPRIMARY_COLOR,
    );
  }
}
