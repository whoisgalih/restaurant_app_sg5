import 'package:flutter/material.dart';
import 'package:restaurant_app/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // textTheme: TextTheme(
        //   headline1:
        // ),
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
      ),
      title: 'Restaurant App',
      home: Text(
        'Hello',
        style: headings("h1"),
      ),
    );
  }
}
