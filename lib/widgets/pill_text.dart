import 'package:flutter/material.dart';
import 'package:restaurant_app/theme/theme.dart';

class PillText extends StatelessWidget {
  final String text;

  const PillText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(this.text, style: body('2')),
        decoration: BoxDecoration(
            color: Color(0xFFF3F1F1), borderRadius: BorderRadius.circular(20)));
  }
}
