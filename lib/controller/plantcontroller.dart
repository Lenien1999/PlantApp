import 'package:flutter/material.dart';

import '../model/plantmodel.dart';

class ScreenProvider extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  set pageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  final List<Plants> _cartItem = [];
  List<Plants> get cartItem => _cartItem;

  void addToCart(Plants plant) {
    _cartItem.add(plant);
    notifyListeners();
  }

  int _cartCount = 0;
  int get cartCount => _cartCount;
  set cartCount(int count) {
    _cartCount++;
    notifyListeners();
  }

  void removeCart(Plants plant) {
    _cartItem.remove(plant);
    notifyListeners();
  }

  void increaseQty(Plants plant) {
    plant.quantity += 1;

    notifyListeners();
  }

  void decreaseQty(Plants itemId) {
    if (itemId.quantity > 1) {
      itemId.quantity -= 1;
    } else {
      null;
    }
    notifyListeners();
  }

double get updatePrice {
    double total = 0;
    for (Plants plant in _cartItem) {
      total += plant.price * plant.quantity;
    }
    total -= total * 0.2;
    return total;
  }
}
