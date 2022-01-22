import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/theme/theme.dart';
import 'package:restaurant_app/pages/food_page.dart';

class Category extends StatelessWidget {
  final String imageFile;
  final String text;

  const Category({
    Key? key,
    required this.imageFile,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => FoodPage())),
      child: Container(
        width: 70,
        child: Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: border,
                  width: 1,
                ),
              ),
              child: SvgPicture.asset(
                'assets/images/icon/' + this.imageFile,
                height: 24,
                width: 24,
                fit: BoxFit.scaleDown,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(text, style: subTitle('2')),
          ],
        ),
      ),
    );
  }
}
