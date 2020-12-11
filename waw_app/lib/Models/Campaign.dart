import 'package:flutter/foundation.dart';
import 'package:waw_app/Models/Prize.dart';
import 'package:waw_app/Models/Product.dart';

import 'Offer.dart';

class Campaign {
  final int id;
  final String maxDrawDate; // "1999-09-05 14:37:48",
  final int productQuantity;
  final int quantitySold;
  final String status; //"active"
  final String code;
  final int ticketCount;
  final int donateTicketCount;
  final int earlyBirdCount;
  final int earlyBirdTicketCount;
  final int price;
  final int isFavorite;
  final Product product;
  final Prize prize;
  final List<Offer> offers;

  Campaign({
    @required this.id,
    this.maxDrawDate,
    this.productQuantity,
    this.quantitySold,
    this.status,
    this.code,
    this.ticketCount,
    this.donateTicketCount,
    this.earlyBirdCount,
    this.earlyBirdTicketCount,
    this.price,
    this.isFavorite,
    this.product,
    this.prize,
    this.offers,
  });

  factory Campaign.fromJSON(Map<String, dynamic> json) {
    return Campaign(
      id: json['id'],
      maxDrawDate: json['max_draw_date'],
      productQuantity: json['product_quantity'],
      quantitySold: json['quantity_sold'],
      status: json['status'],
      code: json['code'],
      ticketCount: json['ticket_count'],
      donateTicketCount: json['donate_ticket_count'],
      earlyBirdCount: json['early_bird_count'],
      earlyBirdTicketCount: json['early_bird_ticket_count'],
      price: json['price'],
      isFavorite: json['isFavorite'],
      product: Product.fromJSON(json['product_id']),
      prize: Prize.fromJSON(json['prize_id']),
      offers: (json['offers'] as List<dynamic>)
          .map((e) => Offer.fromJSON(e))
          .toList(),
    );
  }

  int get campaignID => this.id;

  int get productID => this.product.id;

  int get prizeID => this.prize.id;

  String get productImageLink => this.product.image;

  String get prizeImageLink => this.prize.image;

  String get productName => this.product.name;

  String get prizeName => this.prize.name;

  String get productPrice => 'AED ' + this.price.toString() + '.00';

  int get qtySold => this.quantitySold;

  int get qtyStock => this.productQuantity;

  double get qtyPercentage => this.quantitySold / this.productQuantity;

  int get availableStock => this.productQuantity - this.quantitySold;
}
