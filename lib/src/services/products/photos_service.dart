import 'package:mandaditos/src/classes/photo_class.dart';
import 'package:mandaditos/src/enviroments/env.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PhotoService {
  static Future<List<Photo>> getPhotos() async {
    try {
      final response = await http.get(environment['apiUrl'] + "/photos");
      if (response.statusCode == 200) {
        List<Photo> list = parsePhotos(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Parse the JSON response and return list of Photo Objects //
  static List<Photo> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }
}
