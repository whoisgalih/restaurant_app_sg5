import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/theme/theme.dart';

typedef void IntCallback(int val);

class QtyStl extends StatelessWidget {
  final IntCallback callback;
  final double height;
  final TextStyle? textStyle;
  final int quantity;

  const QtyStl(
      {Key? key,
      this.height = 16.0,
      this.textStyle,
      required this.callback,
      required this.quantity})
      : super(key: key);

  void _add() {
    callback(quantity + 1);
  }

  void _substract() {
    if (quantity > 0) {
      callback(quantity - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 91,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => _substract(),
            child: SvgPicture.asset('assets/images/icon/remove-circle.svg',
                height: height,
                width: height,
                color: quantity > 0 ? primary50 : gray),
          ),
          Text(quantity.toString(), style: textStyle ?? body('2', gray)),
          GestureDetector(
            onTap: () => _add(),
            child: SvgPicture.asset('assets/images/icon/add-circle.svg',
                height: height, width: height),
          ),
        ],
      ),
    );
  }
}
