import 'package:flutter/material.dart';
import 'package:mandaditos/src/classes/product_class.dart';

class ProductsProvider extends ChangeNotifier {
  List<Product> _productos = [];
  String _total = '0.00';

  get total {
    return _total;
  }

  get products {
    return _productos;
  }

  calcularTotal() {
    double total =
        _productos.fold(0, (acc, cur) => acc + double.parse(cur.subTotal));
    _total = total.toStringAsFixed(2);
  }

  set products(Product product) {
    if (_productos.contains(product)) {
      int index = _productos.indexWhere((element) => element.id == product.id);
      if (_productos[index].cantidad < 50) {
        _productos[index].cantidad++;
        _productos[index].subTotal =
            (double.parse(product.precio) * _productos[index].cantidad)
                .toStringAsFixed(2);
      }
      calcularTotal();
      notifyListeners();
      return;
    }
    product.cantidad = 1;
    product.subTotal = product.precio;
    _productos.add(product);
    calcularTotal();
    notifyListeners();
  }

  set restarItemCarrito(int id) {
    int index = _productos.indexWhere((element) => element.id == id);
    if (_productos[index].cantidad > 1) {
      _productos[index].cantidad--;
      _productos[index].subTotal =
          (double.parse(_productos[index].precio) * _productos[index].cantidad)
              .toStringAsFixed(2);
    }
    calcularTotal();
    notifyListeners();
  }

  set sumarItemCarrito(int id) {
    int index = _productos.indexWhere((element) => element.id == id);
    if (_productos[index].cantidad < 50) {
      _productos[index].cantidad++;
      _productos[index].subTotal =
          (double.parse(_productos[index].precio) * _productos[index].cantidad)
              .toStringAsFixed(2);
    }
    calcularTotal();
    notifyListeners();
  }

  set eliminarItemCarrito(int id) {
    _productos.removeWhere((element) => element.id == id);
    calcularTotal();
    notifyListeners();
  }
}
