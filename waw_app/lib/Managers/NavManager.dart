import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waw_app/Blocs/LoginBloc.dart';
import 'package:waw_app/Enums/Scene.dart';
import 'package:waw_app/Scenes/CartScene.dart';
import 'package:waw_app/Scenes/HomeScene.dart';
import 'package:waw_app/Scenes/LoginScene.dart';
import 'package:waw_app/Scenes/WishlistScene.dart';

export 'package:waw_app/Enums/Scene.dart';

class NavManager {
  static Map<String, Widget Function(BuildContext)> get getRoutes => {
        LoginScene.SceneName: (context) =>
            Provider(create: (_) => LoginBloc(), child: LoginScene()),
        HomeScene.SceneName: (context) => HomeScene(),
        CartScene.SceneName: (context) => CartScene(),
        WishlistScene.SceneName: (context) => WishlistScene(),
      };

  //TODO: create navigation goToScene and enums
  static void goTo(Scene scene, BuildContext context) {
    Navigator.of(context).pushNamed(scene.name);
  }
}
