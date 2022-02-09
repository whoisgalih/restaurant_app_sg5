import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

import 'package:restaurant_app/theme/theme.dart';
import 'package:restaurant_app/widgets/pill_text.dart';
import 'package:restaurant_app/widgets/food_list.dart';
import 'package:restaurant_app/pages/cart_page.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  late TextEditingController _controller;
  List<Map> _foods = [];
  List<String> _tags = [];
  List<Map>? _searchResult = null;
  List<Map>? _filtered = null;
  // List<String>? _filterTags = null;
  List<String> _filterTags = [];

  search(String text) {
    if (text == '') {
      setState(() {
        _searchResult = null;
      });
      return;
    }

    List<Map> result = (_filtered ?? _foods)
        .where(
            (food) => food['name'].toLowerCase().contains(text.toLowerCase()))
        .toList();
    setState(() {
      _searchResult = result;
    });
  }

  filter(List<String> tags) {
    if (tags.isEmpty) {
      setState(() {
        _filtered = null;
      });
      return;
    }

    List<List> temp = [];
    tags.forEach((tag) {
      temp.add(_foods.where((food) => food['tags'].contains(tag)).toList());
    });

    List _result = temp
        .fold<Set>(
            temp.first.toSet(),
            (previousValue, element) =>
                previousValue.intersection(element.toSet()))
        .toList();

    List<Map> result = [..._result];

    setState(() {
      _filtered = result != [] ? result : null;
    });
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/food.json');
    final Map data = await json.decode(response);
    final List<Map> foods = [...data['foods']];
    List<String> tags = [];
    for (var food in foods) {
      final List<String> __tags = [...food['tags']];
      tags.addAll(__tags);
    }
    setState(() {
      _foods = foods;
      _tags = tags.toSet().toList();
    });
  }

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
    readJson();
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
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartPage())),
                    child: SvgPicture.asset('assets/images/icon/cart_black.svg',
                        height: 24, width: 24),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    clipBehavior: Clip.none,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: _controller,
                          onChanged: search(_controller.text),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: white,
                            hintText: 'Name',
                            hintStyle: body('1', gray),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 13.0),
                              child: SvgPicture.asset(
                                  'assets/images/icon/search.svg',
                                  color: gray,
                                  height: 20,
                                  width: 20),
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
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                          ),
                        ),
                        SizedBox(height: 24),
                        SingleChildScrollView(
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 16,
                            children: _tags
                                .map((e) => GestureDetector(
                                    onTap: () {
                                      if (_filterTags.contains(e)) {
                                        setState(() {
                                          _filterTags.remove(e);
                                        });
                                        filter(_filterTags);
                                      } else {
                                        setState(() {
                                          _filterTags.add(e);
                                        });
                                        filter(_filterTags);
                                      }
                                    },
                                    child: PillText(
                                        text: e,
                                        active: _filterTags.contains(e))))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  (_searchResult ?? _filtered ?? _foods).isEmpty
                      ? Container(
                          padding:
                              EdgeInsets.only(top: 80, left: 20, right: 20),
                          child: Column(children: [
                            SvgPicture.asset(
                                'assets/images/icon/restaurant.svg',
                                height: 160,
                                width: 160),
                            SizedBox(height: 24),
                            Text(
                              'Well, there is no food you are looking for :(',
                              style: title('1'),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 50),
                            Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: primary50,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12)),
                                child: Text('Find Other Food',
                                    style: subTitle('2', white)),
                                onPressed: () {
                                  setState(() {
                                    _controller.text = '';
                                  });
                                },
                              ),
                            )
                          ]))
                      : FoodList(foods: _searchResult ?? _filtered ?? _foods),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
