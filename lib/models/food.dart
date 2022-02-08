import 'package:flutter/foundation.dart';

class Food {
  final String image;
  final String name;
  final String star;
  final String price;

  Food({
    Key? key,
    required this.image,
    required this.name,
    required this.star,
    required this.price,
  });
}
