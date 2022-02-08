import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/theme/theme.dart';

class RecommendationItem extends StatelessWidget {
  final String package;
  final String qty;
  final String price;
  final String imageFile;
  final String star;

  const RecommendationItem({
    Key? key,
    required this.imageFile,
    required this.package,
    required this.qty,
    required this.price,
    required this.star,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 262,
      width: 160,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Color(0x1F000000), blurRadius: 10, offset: Offset(0, 1)),
        ],
        color: white,
      ),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
                image: AssetImage(
                    'assets/images/recommendation/' + this.imageFile)),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(this.package, style: subTitle('2')),
                  Text(this.qty, style: body('3', Color(0xFF756F6F))),
                  SizedBox(height: 4),
                  Text(this.price, style: body('2')),
                ],
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6)),
                color: Color(0xB5000000),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/icon/star.svg',
                      height: 16, width: 16),
                  SizedBox(width: 8),
                  Text(
                    star,
                    style: body('3', white),
                  )
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
