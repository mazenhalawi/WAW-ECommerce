import 'package:flutter/material.dart';

class HomeScene extends StatelessWidget {
  static const SceneName = 'HomeScene';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
      ),
      body: Container(),
    );
  }
}
