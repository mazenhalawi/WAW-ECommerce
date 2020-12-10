import 'package:flutter/material.dart';
import 'package:waw_app/Scenes/CartScene.dart';
import 'package:waw_app/Scenes/HomeScene.dart';
import 'package:waw_app/Scenes/LoginScene.dart';
import 'package:waw_app/Scenes/WishlistScene.dart';

enum Scene { LOGIN, HOME, WISHLIST, CART }

extension Getters on Scene {
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

  String get title {
    switch (this) {
      case Scene.LOGIN:
        return 'Login';
      case Scene.HOME:
        return 'Campaign';
      case Scene.CART:
        return 'Shopping Cart';
      case Scene.WISHLIST:
        return 'Wish List';
    }
  }

  IconData get icon {
    switch (this) {
      case Scene.LOGIN:
        return Icons.account_circle;
      case Scene.HOME:
        return Icons.campaign;
      case Scene.CART:
        return Icons.shopping_cart_rounded;
      case Scene.WISHLIST:
        return Icons.star;
    }
  }
}
