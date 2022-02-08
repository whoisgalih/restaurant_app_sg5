import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/food_item.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FoodList extends StatelessWidget {
  final List<Map> foods;

  const FoodList({
    Key? key,
    required this.foods,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      padding: EdgeInsets.symmetric(horizontal: 20),
      crossAxisCount: 2,
      mainAxisSpacing: 24,
      crossAxisSpacing: 23,
      physics:
          NeverScrollableScrollPhysics(), // to disable GridView's scrolling
      shrinkWrap: true, // You won't see infinite size error
      itemBuilder: (context, index) {
        final food = foods[index];
        return FoodItem(
            image: food['image'],
            name: food['name'],
            star: food['star'],
            price: food['price']);
      },
      itemCount: foods.length,
    );
  }
}
