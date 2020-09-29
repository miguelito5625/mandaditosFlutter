import 'dart:ffi';

class Photo {
  int id;
  int albumId;
  String title;
  String url;
  String thumbnailUrl;
  Photo({this.id, this.albumId, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
        id: json['id'] as int,
        albumId: json['albumId'] as int,
        title: json['title'] as String,
        url: json['url'] as String,
        thumbnailUrl: json['thumbnailUrl'] as String);
  }
}
