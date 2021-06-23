import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

class Products with ChangeNotifier {
  //force to use the addItem()
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  addItem() {
    //TODO: add product to _items
    notifyListeners();
  }
}
