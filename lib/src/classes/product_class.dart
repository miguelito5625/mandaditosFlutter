import 'dart:ffi';

class Product {
  int id;
  String nombre;
  String precio;
  String urlImagen;
  String urlMiniaturaImagen;
  int cantidad;
  String subTotal;

  Product(
      {this.id,
      this.nombre,
      this.precio,
      this.urlImagen,
      this.urlMiniaturaImagen,
      this.cantidad,
      this.subTotal});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'] as int,
        nombre: json['nombre'] as String,
        precio: json['precio'] as String,
        urlImagen: json['urlImagen'] as String,
        urlMiniaturaImagen: json['urlMiniaturaImagen'] as String);
  }
}
