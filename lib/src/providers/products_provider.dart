import 'package:flutter/material.dart';
import 'package:mandaditos/src/classes/product_class.dart';

class ProductsProvider extends ChangeNotifier {
  List<Product> _productos = [];

  get products {
    return _productos;
  }

  set products(Product product) {
    if (this._productos.contains(product)) {
      for (var i = 0; i < this._productos.length; i++) {
        if (this._productos[i].id == product.id) {
          this._productos[i].cantidad++;
        }
      }
      notifyListeners();
      return;
    }
    product.cantidad = 1;
    this._productos.add(product);
    notifyListeners();
  }
}
