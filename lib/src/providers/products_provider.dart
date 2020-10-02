import 'package:flutter/material.dart';
import 'package:mandaditos/src/classes/product_class.dart';

class ProductsProvider extends ChangeNotifier {
  List<Product> _productos = [];

  get products {
    return _productos;
  }

  set products(Product product) {
    this._productos.add(product);
    notifyListeners();
  }
}
