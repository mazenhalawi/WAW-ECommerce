import 'package:flutter/material.dart';
import 'package:waw_app/Enums/Scene.dart';
import 'package:waw_app/Managers/NavManager.dart';
import 'package:waw_app/Utility/Constants.dart';
import 'package:waw_app/Views/DrawerTile.dart';

export 'package:waw_app/Enums/Scene.dart';

class NavDrawer extends StatelessWidget {
  final Scene selectedScene;

  NavDrawer({this.selectedScene});

  List<Scene> get scenes =>
      Scene.values.where((scene) => scene != Scene.LOGIN).toList();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              color: kPRIMARY_COLOR,
              child: Text('User'),
            ),
          ),
          ...scenes
              .map((e) => DrawerTile(
                    isSelected:
                        selectedScene == null ? false : e == selectedScene,
                    title: e.title,
                    onTap: selectedScene == e
                        ? () => Navigator.pop(context)
                        : () => NavManager.goTo(e, context),
                  ))
              .toList()
        ],
      ),
    );
  }
}
