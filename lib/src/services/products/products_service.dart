import 'package:mandaditos/src/classes/product_class.dart';
import 'package:mandaditos/src/enviroments/env.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductService {
  static Future<List<Product>> getPhotos() async {
    try {
      final response = await http.get(environment['apiUrl'] +
          "https://jsonplaceholder.typicode.com/photos");
      if (response.statusCode == 200) {
        List<Product> list = parsePhotos(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Parse the JSON response and return list of Product Objects //
  static List<Product> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }
}
