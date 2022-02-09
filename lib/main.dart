import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_app/pages/home_page.dart';
import 'package:restaurant_app/provider/cart_provider.dart';
import 'package:restaurant_app/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartProvider>(
        create: (context) => CartProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFFFFFFF),
          ),
          title: 'Restaurant App',
          home: App(),
        ));
  }
}

class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Index 1: Search',
      style: optionStyle,
    ),
    Text(
      'Index 2: Recent',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 72,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color(0x0A000000),
                blurRadius: 10,
                offset: Offset(0, -8)),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: white,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset(
                  'assets/images/icon/home.svg',
                  height: 24,
                  width: 24,
                  fit: BoxFit.scaleDown,
                  color: _selectedIndex == 0 ? primary50 : gray,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset(
                  'assets/images/icon/search.svg',
                  height: 24,
                  width: 24,
                  fit: BoxFit.scaleDown,
                  color: _selectedIndex == 1 ? primary50 : gray,
                ),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset(
                  'assets/images/icon/refresh-circle.svg',
                  height: 24,
                  width: 24,
                  fit: BoxFit.scaleDown,
                  color: _selectedIndex == 2 ? primary50 : gray,
                ),
              ),
              label: 'Recent',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset(
                  'assets/images/icon/person.svg',
                  height: 24,
                  width: 24,
                  fit: BoxFit.scaleDown,
                  color: _selectedIndex == 3 ? primary50 : gray,
                ),
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,

          // Unselected
          unselectedItemColor: gray,
          unselectedFontSize: 16,
          showUnselectedLabels: true,
          unselectedLabelStyle: subTitle('2'),

          // Selected
          selectedItemColor: primary50,
          selectedFontSize: 16,
          showSelectedLabels: true,
          selectedLabelStyle: subTitle('2'),

          // others
          enableFeedback: false,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
