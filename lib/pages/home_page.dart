import 'package:flutter/material.dart';
import 'package:restaurant_app/theme/theme.dart';
import 'package:restaurant_app/widgets/category.dart';
import 'package:restaurant_app/widgets/recommendation_item.dart';
import 'package:restaurant_app/pages/cart_page.dart';
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
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage())),
                  child: SvgPicture.asset('assets/images/icon/cart.svg',
                      height: 28, width: 28),
                )
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Slider(
            items: [
              'assets/images/carousel-image/super deal date.png',
              'assets/images/carousel-image/super family.png',
              'assets/images/carousel-image/combo deal.png',
            ],
          ),
          Container(
            clipBehavior: Clip.none,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32,
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

class Slider extends StatefulWidget {
  final List<String> items;

  const Slider({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 159,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
            disableCenter: true,
          ),
          items: widget.items
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.items.asMap().entries.map(
            (entry) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key ? primary50 : gray,
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
