import 'dart:ffi';

class Photo {
  int id;

  Photo({this.id});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(id: json['id'] as int);
  }
}
