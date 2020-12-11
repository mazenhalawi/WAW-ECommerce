import 'package:flutter/foundation.dart';

class Product {
  final int id;
  final bool isPrize;
  final String image;
  final String name;
  final String description;

  Product(
      {@required this.id,
      this.isPrize,
      this.image,
      this.name,
      this.description});

  factory Product.fromJSON(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      isPrize: json['is_prize'] == 1,
      image: json['image'],
      name: json['name'],
      description: json['description'],
    );
  }
}
