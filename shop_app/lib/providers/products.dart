import 'package:flutter/material.dart';
//import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/product_pr.dart';

class Products with ChangeNotifier {
  //force to use the addItem()
  List<Product_pr> _items = [
    Product_pr(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product_pr(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product_pr(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product_pr(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
  // var _showFavoritesOnly = false;
  List<Product_pr> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((element) => element.isFavorite).toList();
    // } it filters in all view, not a good approach

    return [..._items];
  }

  List<Product_pr> get favorites {
    return _items.where((element) => element.isFavorite).toList();
  }

  Product_pr findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  addItem(Product_pr pr) {
    //TODO: add product to _items
    final newProduct = Product_pr(
        id: DateTime.now().toString(),
        title: pr.title,
        description: pr.description,
        price: pr.price,
        imageUrl: pr.imageUrl);
    _items.add(newProduct);
    // _items.insert(0, newProduct); to the frond
    notifyListeners();
  }

  void updateProduct(String id, Product_pr newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }
}
