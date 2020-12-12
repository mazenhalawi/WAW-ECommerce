import 'package:flutter/material.dart';
import 'package:waw_app/Blocs/OrderBloc.dart';
import 'package:waw_app/Models/Campaign.dart';

class CartBloc with ChangeNotifier {
  List<Campaign> _cartList = [];

  int get numberOFItemsInCart => _cartList.length;

  List<Campaign> get cartItems => _cartList;

  void addToCart(Campaign campaign) {
    _cartList.add(campaign);
    notifyListeners();
  }

  void removeFromCart({Campaign campaign}) {
    OrderBloc.shared.deleteOrder(campaignID: campaign.campaignID);
    _cartList.removeWhere((element) => element == campaign);
    notifyListeners();
  }
}
