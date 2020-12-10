import 'package:flutter/material.dart';
import 'package:waw_app/Managers/NavManager.dart';
import 'package:waw_app/Views/NavDrawer.dart';

class BaseScene extends StatefulWidget {
  static const SceneName = 'BaseScene';
  @override
  _BaseSceneState createState() => _BaseSceneState();
}

class _BaseSceneState extends State<BaseScene> {
  final _pageController = PageController(initialPage: 0);
  Scene _selectedScene = Scene.HOME;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedScene.title),
      ),
      body: PageView(
        controller: _pageController,
        children: NavManager.scenes.cast<Widget>(),
        physics: NeverScrollableScrollPhysics(),
      ),
      drawer: NavDrawer(
        selectedScene: _selectedScene,
        onTap: (selectedScene) {
          setState(() {
            _selectedScene = selectedScene;
            _pageController.jumpToPage(_getPagePosition(selectedScene));
            Navigator.of(context).pop();
          });
        },
      ),
    );
  }

  int _getPagePosition(Scene scene) {
    switch (scene) {
      case Scene.BASE:
      case Scene.LOGIN:
      case Scene.HOME:
        return 0;
      case Scene.CART:
        return 1;
      case Scene.WISHLIST:
        return 2;
    }
    return 0;
  }
}
