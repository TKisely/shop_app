import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items;

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      //change q.
      _items.update(
          productId,
          (existing) => CartItem(
              id: existing.id,
              price: existing.price,
              quantity: existing.quantity + 1,
              title: existing.title));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(), //in cart id
              price: price,
              quantity: 1,
              title: title));
    }
  }
}

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.price,
      required this.quantity,
      required this.title});
}
