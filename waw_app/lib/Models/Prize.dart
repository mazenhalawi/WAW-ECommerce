import 'package:flutter/foundation.dart';

class Prize {
  final int id;
  final bool isPrize;
  final String image;
  final String name;
  final String description;

  Prize(
      {@required this.id,
      this.isPrize,
      this.image,
      this.name,
      this.description});

  factory Prize.fromJSON(Map<String, dynamic> json) {
    return Prize(
      id: json['id'],
      isPrize: json['is_prize'] == 1,
      image: json['image'],
      name: json['name'],
      description: json['description'],
    );
  }
}
