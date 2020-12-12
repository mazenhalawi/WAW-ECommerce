import 'package:flutter/foundation.dart';

class OrderBloc extends ChangeNotifier {
  Map<String, int> _orders = {};

  Map<String, int> get orders => _orders;

  static final shared = OrderBloc._();

  OrderBloc._();

  void updateOrders({@required String campaignID, @required int quantity}) {
    _orders[campaignID] = quantity;
    notifyListeners();
  }

  void deleteOrder({@required String campaignID}) {
    _orders.remove(campaignID);
  }

  void deleteAllOrders() {
    _orders = {};
  }
}
