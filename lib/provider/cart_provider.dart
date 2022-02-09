import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';
import 'package:restaurant_app/models/food.dart';
import 'package:restaurant_app/pages/cart_page.dart';

class CartProvider with ChangeNotifier {
  List<Food> _foods = [];

  List<Food> get foods => _foods;

  Food? findById(String id) => _foods.firstWhereOrNull((food) => food.id == id);

  findIndexById(String id) {
    for (var i = 0; i < _foods.length; i++) {
      if (_foods[i].id == id) {
        return i;
      }
    }
  }

  addFood(Food food) {
    if (findById(food.id) == null) {
      _foods.add(food);
    }
    notifyListeners();
  }

  editFood(Food food) {
    int index = findIndexById(food.id);
    _foods[index] = food;
    notifyListeners();
  }

  removeFood(Food food) {
    _foods.remove(food);
    notifyListeners();
  }

  clearAll() {
    _foods.clear();
    notifyListeners();
  }
}
