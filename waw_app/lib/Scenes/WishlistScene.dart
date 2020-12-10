import 'package:flutter/material.dart';

class WishlistScene extends StatefulWidget {
  static const SceneName = 'WishlistScene';

  @override
  _WishlistSceneState createState() => _WishlistSceneState();
}

class _WishlistSceneState extends State<WishlistScene>
    with AutomaticKeepAliveClientMixin<WishlistScene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
