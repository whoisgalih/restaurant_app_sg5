import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/theme/theme.dart';
import 'package:restaurant_app/components/pill_text.dart';
import 'package:restaurant_app/components/food_list.dart';

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: white,
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x0A000000),
                      blurRadius: 10,
                      offset: Offset(0, 6)),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(
                              'assets/images/icon/arrow-back.svg',
                              height: 24,
                              width: 24)),
                      SizedBox(width: 16),
                      Text('Food', style: title('2')),
                    ],
                  ),
                  SvgPicture.asset('assets/images/icon/cart_black.svg',
                      height: 24, width: 24)
                ],
              ),
            ),
            Container(
              clipBehavior: Clip.none,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: white,
                      hintText: 'Name',
                      hintStyle: body('1', gray),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13.0),
                        child: SvgPicture.asset('assets/images/icon/search.svg',
                            color: gray, height: 20, width: 20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: gray,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                  ),
                  SizedBox(height: 24),
                  SingleChildScrollView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 16,
                      children: [
                        'Dinner Food',
                        'Economic Food',
                        'Hot Food',
                        'Family Food',
                        'Super Food'
                      ].map((e) => PillText(text: e)).toList(),
                    ),
                  ),
                ],
              ),
            ),
            FoodList(foods: [
              {
                'image': 'Intersect.png',
                'name': 'Meatball Sweatie',
                'star': '4.9',
                'price': 'Rp63.500'
              },
              {
                'image': 'Intersect-2.png',
                'name': 'Noodle Ex',
                'star': '4.8',
                'price': 'Rp42.000'
              },
              {
                'image': 'Intersect-1.png',
                'name': 'Burger Ala Ala',
                'star': '4.7',
                'price': 'Rp55.500'
              },
              {
                'image': 'Intersect-3.png',
                'name': 'Chicken Collage',
                'star': '4.5',
                'price': 'Rp78.200'
              },
            ]),
          ],
        ),
      ),
    );
  }
}
