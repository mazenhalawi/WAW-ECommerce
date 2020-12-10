import 'package:flutter/foundation.dart';

class Prize {
  int id;
  bool isPrize;
  String image;
  String name;
  String description;

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
