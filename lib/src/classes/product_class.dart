import 'dart:ffi';

class Product {
  int id;
  String nombre;
  Float precio;
  String urlImagen;
  Product({this.id, this.nombre, this.precio, this.urlImagen});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'] as int,
        nombre: json['nombre'] as String,
        precio: json['precio'] as Float,
        urlImagen: json['urlImagen'] as String);
  }
}
