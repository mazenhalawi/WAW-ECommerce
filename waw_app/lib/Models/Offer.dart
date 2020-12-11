import 'package:flutter/foundation.dart';

class Offer {
  final int id;
  final int productLimit;
  final int extraTicketCount;

  Offer({@required this.id, this.productLimit, this.extraTicketCount});

  factory Offer.fromJSON(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      productLimit: json['product_limit'],
      extraTicketCount: json['extra_limit_count'],
    );
  }
}
