import 'package:flutter/material.dart';
import 'package:restaurant_app/theme/theme.dart';
import 'package:restaurant_app/components/category.dart';
import 'package:restaurant_app/components/recommendation_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 8),
            // Container Column (Main Column)
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, Michael',
                      style: title("1"),
                    ),
                    Text('Get your favorite food here!', style: subTitle("2"))
                  ],
                ),
                SvgPicture.asset('assets/images/icon/cart.svg',
                    height: 28, width: 28)
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 159,
              // disableCenter: true,
            ),
            items: [
              'assets/images/carousel-image/super deal date.png',
              'assets/images/carousel-image/super family.png',
              'assets/images/carousel-image/combo deal.png',
            ]
                .map((item) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: gray,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Image(
                        image: AssetImage(item),
                        height: 160,
                        width: 320,
                      ),
                    ))
                .toList(),
          ),
          Container(
            clipBehavior: Clip.none,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 56,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ['food.svg', 'Food'],
                      ['table.svg', 'Table'],
                      ['payment.svg', 'Payment'],
                      ['more.svg', 'More'],
                    ]
                        .map((item) =>
                            Category(imageFile: item[0], text: item[1]))
                        .toList()),
                SizedBox(
                  height: 40,
                ),
                Text('Recommendation', style: title('2')),
                SizedBox(height: 16),
                SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 16,
                      children: [
                        [
                          'Intersect.png',
                          'Family Package',
                          '1 large table 6 chair',
                          "Rp320.000",
                          '4.7'
                        ],
                        [
                          'Intersect-1.png',
                          'Family Package',
                          '1 large table 6 chair',
                          "Rp320.000",
                          '4.9'
                        ],
                        [
                          'Intersect.png',
                          'Family Package',
                          '1 large table 6 chair',
                          "Rp320.000",
                          '4.7'
                        ],
                        [
                          'Intersect-1.png',
                          'Family Package',
                          '1 large table 6 chair',
                          "Rp320.000",
                          '4.9'
                        ],
                      ]
                          .map(
                            (e) => RecommendationItem(
                                imageFile: e[0],
                                package: e[1],
                                qty: e[2],
                                price: e[3],
                                star: e[4]),
                          )
                          .toList()),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
