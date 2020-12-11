import 'package:flutter/foundation.dart';
import 'package:waw_app/Models/Campaign.dart';

class WishlistBloc with ChangeNotifier {
  Set<Campaign> _wishlist = Set();

  int get listCount => _wishlist.length;

  List<Campaign> get wishListed => _wishlist.toList();

  void addToWishList({@required Campaign campaign}) {
    _wishlist.add(campaign);
    notifyListeners();
  }

  void removeFromWishList({@required Campaign campaign}) {
    _wishlist.removeWhere((element) => element.id == campaign.id);
    notifyListeners();
  }
}
