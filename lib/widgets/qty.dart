import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/theme/theme.dart';

class QTY extends StatefulWidget {
  final double height;
  final TextStyle? textStyle;

  const QTY({
    Key? key,
    this.height = 16.0,
    this.textStyle,
  }) : super(key: key);

  @override
  State<QTY> createState() => _QTYState();
}

class _QTYState extends State<QTY> {
  int qty = 1;

  void _add() {
    setState(() {
      qty += 1;
    });
  }

  void _substract() {
    if (qty != 1) {
      setState(() {
        qty -= 1;
      });
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
                height: widget.height,
                width: widget.height,
                color: qty == 1 ? gray : primary50),
          ),
          Text(qty.toString(), style: widget.textStyle ?? body('2', gray)),
          GestureDetector(
            onTap: () => _add(),
            child: SvgPicture.asset('assets/images/icon/add-circle.svg',
                height: widget.height, width: widget.height),
          ),
        ],
      ),
    );
  }
}
