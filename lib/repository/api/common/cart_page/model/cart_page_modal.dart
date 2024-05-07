import 'package:flutter/cupertino.dart';

class Items {
  final String name;
  final String? image;
  final double? price;
  int count;
  final Color? color;
  final String? description;
  final String? sourceName;
  final double? quantity;

  Items(
      {this.quantity,
      this.description,
      this.color,
      this.sourceName,
      required this.name,
      this.image,
      this.price,
      this.count = 0});
}
