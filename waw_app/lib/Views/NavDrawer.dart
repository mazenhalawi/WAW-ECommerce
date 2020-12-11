import 'package:flutter/material.dart';
import 'package:waw_app/Enums/Scene.dart';
import 'package:waw_app/Managers/NavManager.dart';
import 'package:waw_app/Utility/Constants.dart';
import 'package:waw_app/Views/DrawerTile.dart';

export 'package:waw_app/Enums/Scene.dart';

class NavDrawer extends StatelessWidget {
  final Scene selectedScene;
  final Function onTap;

  NavDrawer({this.selectedScene, this.onTap});

  List<Scene> get scenes => Scene.values
      .where((scene) => ![Scene.BASE, Scene.LOGIN].contains(scene))
      .toList();

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
                    isSelected: e == selectedScene,
                    title: e.title,
                    onTap: () => onTap(e),
                  ))
              .toList()
        ],
      ),
    );
  }
}
