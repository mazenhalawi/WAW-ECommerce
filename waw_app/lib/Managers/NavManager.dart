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
  static final homeScene = HomeScene();
  static final cartScene = CartScene();
  static final wishlistScene = WishlistScene();

  static Map<String, Widget Function(BuildContext)> get getRoutes => {
        LoginScene.SceneName: (context) => ChangeNotifierProvider(
            create: (_) => LoginBloc(), child: LoginScene()),
        HomeScene.SceneName: (context) => homeScene,
        CartScene.SceneName: (context) => cartScene,
        WishlistScene.SceneName: (context) => wishlistScene,
      };

  //TODO: create navigation goToScene and enums
  static void goTo(Scene scene, BuildContext context) {
    Navigator.of(context).pushNamed(scene.name);
  }
}
