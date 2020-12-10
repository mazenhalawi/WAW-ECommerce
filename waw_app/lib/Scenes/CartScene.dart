import 'package:flutter/material.dart';
import 'package:waw_app/Views/NavDrawer.dart';

class CartScene extends StatelessWidget {
  static const SceneName = 'CartScene';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Container(),
      drawer: NavDrawer(selectedScene: Scene.CART),
    );
  }
}
