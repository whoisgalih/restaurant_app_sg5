// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/theme/theme.dart';
import 'package:restaurant_app/components/pill_text.dart';

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
    return SafeArea(
      child: Column(
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
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              SizedBox(height: 32),
            ]),
          ),
        ],
      ),
    );
  }
}

// class FoodItem extends StatelessWidget {
//   const FoodItem({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Image(image: AssetImage('assets/images/recommendation/Intersect.png')),
//         Container(
//             margin: EdgeInsets.all(8),
//             child: Column(
//               children: [
//                 Text('Meatball Sweatie', style: subTitle('2')),
//                 Row(children: [
//                   SvgPicture.asset('assets/images/icon/star.svg',
//                       height: 24, width: 24),
//                   Text('Helo'),
//                 ]),
//               ],
//             )),
//       ],
//     );
//   }
// }


