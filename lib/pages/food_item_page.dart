import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/widgets/qty.dart';
import 'package:restaurant_app/theme/theme.dart';

class FoodItemPage extends StatelessWidget {
  final String image;
  final String name;
  final String star;
  final String price;

  const FoodItemPage({
    Key? key,
    required this.image,
    required this.name,
    required this.star,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Stack(children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(
                  image: AssetImage('assets/images/foods/' + image),
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover),
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: title('1'),
                            ),
                            SizedBox(height: 8),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/icon/star.svg',
                                      height: 16,
                                      width: 16),
                                  SizedBox(width: 8),
                                  SvgPicture.asset(
                                      'assets/images/icon/star.svg',
                                      height: 16,
                                      width: 16),
                                  SizedBox(width: 8),
                                  SvgPicture.asset(
                                      'assets/images/icon/star.svg',
                                      height: 16,
                                      width: 16),
                                  SizedBox(width: 8),
                                  SvgPicture.asset(
                                      'assets/images/icon/star.svg',
                                      height: 16,
                                      width: 16),
                                  SizedBox(width: 8),
                                  SvgPicture.asset(
                                      'assets/images/icon/star.svg',
                                      height: 16,
                                      width: 16),
                                  SizedBox(width: 8),
                                  Text(star, style: body('2', gray)),
                                ])
                          ],
                        ),
                        QTY(),
                      ],
                    ),
                    SizedBox(height: 24),
                    Text(price, style: title('1')),
                    SizedBox(height: 32),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: primary50,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12)),
                            onPressed: () {},
                            child: Text('Place Order',
                                style: subTitle('2', white))))
                  ],
                ),
              )
            ],
          ),
        ),
        Center(
            child: Padding(
                padding: EdgeInsets.only(top: 16),
                child: SvgPicture.asset(
                    'assets/images/icon/action bottom sheet.svg',
                    height: 4,
                    width: 40)))
      ]),
    );
  }
}
