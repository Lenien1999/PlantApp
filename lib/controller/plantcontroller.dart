import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import '../model/plantmodel.dart';

class ScreenProvider extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  set pageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  static const _boxName = 'cartBox';

  List<Plants> _cartBox = [];
  // List<Plants> _cartItem = [];

  List<Plants> get cartBox => _cartBox;

  ScreenProvider() {
    loadCartItems();
  }

  Future<void> loadCartItems() async {
    var box = await Hive.openBox<Plants>(_boxName);
    _cartBox = box.values.toList();
    notifyListeners();
  }

  void addToCart(Plants plant) async {
    var box = await Hive.openBox<Plants>(_boxName);
    if (box.containsKey(plant.id)) {
      var existingPlant = box.get(plant.id);
      existingPlant!.quantity += 1;
      box.put(plant.id, existingPlant);
    } else {
      box.put(plant.id, plant);
      loadCartItems();
      notifyListeners();
    }
  }

  void removeCart(Plants plant) async {
    var box = await Hive.openBox<Plants>(_boxName);
    box.delete(plant.id);
    loadCartItems();
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
    for (Plants plant in _cartBox) {
      total += plant.price * plant.quantity;
    }
    total -= total * 0.2;
    return total;
  }

  void emptyCart() async {
    var box = await Hive.openBox<Plants>(_boxName);
    await box.clear();
    _cartBox = [];
    notifyListeners();
  }
}
