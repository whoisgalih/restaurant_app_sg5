import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/models/food.dart';
import 'package:restaurant_app/provider/food_provider.dart';
import 'package:restaurant_app/widgets/qty_stf.dart';
import 'package:restaurant_app/theme/theme.dart';
import 'package:restaurant_app/widgets/qty_stl.dart';

class FoodItemPage extends StatefulWidget {
  final String id;
  final String image;
  final String name;
  final String star;
  final String price;

  const FoodItemPage({
    Key? key,
    required this.id,
    required this.image,
    required this.name,
    required this.star,
    required this.price,
  }) : super(key: key);

  @override
  State<FoodItemPage> createState() => _FoodItemPageState();

  static _FoodItemPageState? of(BuildContext context) =>
      context.findAncestorStateOfType<_FoodItemPageState>();
}

class _FoodItemPageState extends State<FoodItemPage> {
  int _qty = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Stack(children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(
                  image: AssetImage('assets/images/foods/' + widget.image),
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover),
              Container(
                margin: const EdgeInsets.all(20),
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
                              widget.name,
                              style: title('1'),
                            ),
                            const SizedBox(height: 8),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/icon/star.svg',
                                      height: 16,
                                      width: 16),
                                  const SizedBox(width: 8),
                                  SvgPicture.asset(
                                      'assets/images/icon/star.svg',
                                      height: 16,
                                      width: 16),
                                  const SizedBox(width: 8),
                                  SvgPicture.asset(
                                      'assets/images/icon/star.svg',
                                      height: 16,
                                      width: 16),
                                  const SizedBox(width: 8),
                                  SvgPicture.asset(
                                      'assets/images/icon/star.svg',
                                      height: 16,
                                      width: 16),
                                  const SizedBox(width: 8),
                                  SvgPicture.asset(
                                      'assets/images/icon/star.svg',
                                      height: 16,
                                      width: 16),
                                  const SizedBox(width: 8),
                                  Text(widget.star, style: body('2', gray)),
                                ])
                          ],
                        ),
                        Consumer<FoodProvider>(
                          builder: (context, cart, child) {
                            Food? food = cart.findById(widget.id);
                            return food != null
                                ? QtyStl(
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
                                    quantity: food.quantity)
                                : QtyStf(
                                    callback: (val) =>
                                        setState(() => _qty = val),
                                  );
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(widget.price, style: title('1')),
                    const SizedBox(height: 32),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: primary50,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12)),
                            onPressed: () {
                              Provider.of<FoodProvider>(
                                context,
                                listen: false,
                              ).addFood(Food(
                                id: widget.id,
                                image: widget.image,
                                name: widget.name,
                                price: widget.price,
                                quantity: _qty,
                                star: widget.star,
                              ));
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                // action: SnackBarAction(
                                //     label: 'cart',
                                //     onPressed: () =>
                                //         Navigator.pushNamed(context, '/cart')),
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Successfuly place order',
                                        style: body('1', white)),
                                    GestureDetector(
                                      onTap: () =>
                                          Navigator.pushNamed(context, '/cart'),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        child: Text('Cart',
                                            style: subTitle('2', primary50)),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                duration: const Duration(milliseconds: 3000),
                                padding: const EdgeInsets.all(
                                    16 // Inner padding for SnackBar content.
                                    ),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 24),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ));
                            },
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
                padding: const EdgeInsets.only(top: 16),
                child: SvgPicture.asset(
                    'assets/images/icon/action bottom sheet.svg',
                    height: 4,
                    width: 40)))
      ]),
    );
  }
}
