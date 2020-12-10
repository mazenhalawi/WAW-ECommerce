import 'package:flutter/material.dart';
import 'package:waw_app/Views/NavDrawer.dart';

class WishlistScene extends StatelessWidget {
  static const SceneName = 'WishlistScene';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wish List'),
      ),
      body: Container(),
      drawer: NavDrawer(selectedScene: Scene.WISHLIST),
    );
  }
}
