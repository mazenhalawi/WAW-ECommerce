import 'package:flutter/material.dart';
import 'package:waw_app/Models/Campaign.dart';

class CartBloc with ChangeNotifier {
  List<Campaign> _cartList = [];

  int get numberOFItemsInCart => _cartList.length;

  Campaign get firstCampaign => _cartList.first;

  void addToCart(Campaign campaign) {
    _cartList.add(campaign);
    notifyListeners();
  }
}
