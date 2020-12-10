import 'package:flutter/material.dart';
import 'package:waw_app/Views/NavDrawer.dart';

class HomeScene extends StatelessWidget {
  static const SceneName = 'HomeScene';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campaign'),
      ),
      body: Container(),
      drawer: NavDrawer(selectedScene: Scene.HOME),
    );
  }
}
