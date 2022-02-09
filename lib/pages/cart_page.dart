import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/models/food.dart';
import 'package:restaurant_app/provider/food_provider.dart';
import 'package:restaurant_app/widgets/qty_stf.dart';
import 'package:restaurant_app/theme/theme.dart';
import 'package:restaurant_app/pages/food_page.dart';
import 'package:restaurant_app/widgets/qty_stl.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // String _qty;
    // Provider.of<FoodProvider>(
    //   context,
    //   listen: false,
    // ).clearAll();
    return Scaffold(
      body: SafeArea(
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
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(
                          'assets/images/icon/arrow-back.svg',
                          height: 24,
                          width: 24)),
                  SizedBox(width: 16),
                  Text('Cart', style: title('2')),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  clipBehavior: Clip.none,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Food', style: subTitle('1')),
                      SizedBox(height: 16),
                      Consumer<FoodProvider>(builder: (context, cart, child) {
                        return Column(children: [
                          ...cart.foods
                              .map((food) => CartFoodItem(food: food))
                              .toList(),
                          Center(
                              child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FoodPage())),
                            child: Text(
                                cart.foods.length > 0
                                    ? 'add more food'
                                    : 'add food',
                                style: subTitle('2', primary50)),
                          )),
                        ]);
                      }),
                      SizedBox(height: 24),
                      Text('Table', style: subTitle('1')),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: white,
                                ),
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/foods/Intersect-3.png'),
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.cover),
                              ),
                              SizedBox(width: 24),
                              Column(
                                children: [
                                  Text('Nama', style: subTitle('2')),
                                  SizedBox(height: 8),
                                  Text('Harga', style: subTitle('2')),
                                ],
                              ),
                            ],
                          ),
                          SvgPicture.asset('assets/images/icon/trash.svg',
                              height: 24, width: 24),
                        ],
                      ),
                      SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Additional', style: subTitle('1')),
                          Text('add more', style: subTitle('2', primary50)),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1 x Flower', style: body('1')),
                          Text('Rp25.000', style: subTitle('2')),
                        ],
                      ),
                      SizedBox(height: 24),
                      Text('Total', style: subTitle('1')),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Food', style: body('1')),
                          Text('Rp136.000', style: subTitle('2')),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Table', style: body('1')),
                          Text('Rp0', style: subTitle('2')),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Flower', style: body('1')),
                          Text('Rp25.000', style: subTitle('2')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: white,
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x0A000000),
                      blurRadius: 10,
                      offset: Offset(0, -2)),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: 'Total: ',
                          style: body('1').copyWith(fontSize: 20),
                          children: [
                        TextSpan(text: 'Rp171.000', style: subTitle('1')),
                      ])),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Continue', style: subTitle('2', white)),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: primary50,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartFoodItem extends StatelessWidget {
  Food food;

  CartFoodItem({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: white,
                ),
                child: Image(
                    image: AssetImage('assets/images/foods/' + food.image),
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover),
              ),
              SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(food.name, style: subTitle('2')),
                  SizedBox(height: 8),
                  Text(food.price, style: subTitle('2')),
                ],
              ),
            ],
          ),
          QtyStl(
            callback: (val) {
              if (val > 0) {
                food.quantity = val;
                Provider.of<FoodProvider>(
                  context,
                  listen: false,
                ).editFood(food);
              } else {
                Provider.of<FoodProvider>(
                  context,
                  listen: false,
                ).removeFood(food);
              }
            },
            height: 19.5,
            textStyle: subTitle('2', gray),
            quantity: food.quantity,
          )
        ],
      ),
    );
  }
}
