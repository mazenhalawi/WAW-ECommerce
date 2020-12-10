import 'package:waw_app/Scenes/CartScene.dart';
import 'package:waw_app/Scenes/HomeScene.dart';
import 'package:waw_app/Scenes/LoginScene.dart';
import 'package:waw_app/Scenes/WishlistScene.dart';

enum Scene { LOGIN, HOME, WISHLIST, CART }

extension Name on Scene {
  String get name {
    switch (this) {
      case Scene.LOGIN:
        return LoginScene.SceneName;
      case Scene.HOME:
        return HomeScene.SceneName;
      case Scene.CART:
        return CartScene.SceneName;
      case Scene.WISHLIST:
        return WishlistScene.SceneName;
    }
  }
}
