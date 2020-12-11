import 'package:flutter/material.dart';
import 'package:waw_app/Models/Campaign.dart';

class CartBloc with ChangeNotifier {
  Map<Campaign, int> _cartList = {};

  int get numberOFItemsInCart => _cartList.length;

  void addToCart(Campaign campaign, int quantity) {
    _cartList[campaign] = quantity;
    print(_cartList);
    notifyListeners();
  }
}
