import 'package:flutter/material.dart';

class CartScene extends StatefulWidget {
  static const SceneName = 'CartScene';

  @override
  _CartSceneState createState() => _CartSceneState();
}

class _CartSceneState extends State<CartScene>
    with AutomaticKeepAliveClientMixin<CartScene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
