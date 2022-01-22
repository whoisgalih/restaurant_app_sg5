import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/food_item_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/theme/theme.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({
    Key? key,
    required this.image,
    required this.name,
    required this.star,
    required this.price,
  }) : super(key: key);

  final String image;
  final String name;
  final String star;
  final String price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showMaterialModalBottomSheet(
          barrierColor: Color(0x4D000000),
          expand: false,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return Wrap(
              children: [
                FoodItemPage(image: image, name: name, star: star, price: price)
              ],
            );
          }),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Color(0x1F000000), blurRadius: 10, offset: Offset(0, 1)),
          ],
          color: white,
        ),
        child: Column(
          children: [
            Image(
                image: AssetImage('assets/images/foods/' + image),
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover),
            Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: subTitle('2')),
                    SizedBox(height: 4),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/icon/star.svg',
                              height: 16, width: 16),
                          SizedBox(width: 8),
                          Text(star, style: body('2', gray)),
                        ]),
                    SizedBox(height: 8),
                    Text(price, style: subTitle('2'))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
