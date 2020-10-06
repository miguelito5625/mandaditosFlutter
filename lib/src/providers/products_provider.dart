import 'package:flutter/material.dart';
import 'package:mandaditos/src/classes/product_class.dart';

class ProductsProvider extends ChangeNotifier {
  List<Product> _productos = [];

  get products {
    return _productos;
  }

  set products(Product product) {
    if (this._productos.contains(product)) {
      int index =
          this._productos.indexWhere((element) => element.id == product.id);
      if (this._productos[index].cantidad < 50) {
        this._productos[index].cantidad++;
        this._productos[index].subTotal =
            (double.parse(product.precio) * this._productos[index].cantidad)
                .toStringAsFixed(2);
      }
      notifyListeners();
      return;
    }
    product.cantidad = 1;
    product.subTotal = product.precio;
    this._productos.add(product);
    notifyListeners();
  }

  set restarItemCarrito(int id) {
    int index = this._productos.indexWhere((element) => element.id == id);
    if (this._productos[index].cantidad > 1) {
      this._productos[index].cantidad--;
      this._productos[index].subTotal =
          (double.parse(this._productos[index].precio) *
                  this._productos[index].cantidad)
              .toStringAsFixed(2);
    }
    notifyListeners();
  }

  set sumarItemCarrito(int id) {
    int index = this._productos.indexWhere((element) => element.id == id);
    if (this._productos[index].cantidad < 50) {
      this._productos[index].cantidad++;
      this._productos[index].subTotal =
          (double.parse(this._productos[index].precio) *
                  this._productos[index].cantidad)
              .toStringAsFixed(2);
    }
    notifyListeners();
  }

  set eliminarItemCarrito(int id) {
    this._productos.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
