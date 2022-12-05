import 'dart:convert';

List<Photo> modelPhotosFromJson(String str) =>
    List<Photo>.from(json.decode(str).map((x) => Photo.fromMap(x)));

class Photo {
  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory Photo.fromJson(String str) => Photo.fromMap(json.decode(str));

  factory Photo.fromMap(Map<String, dynamic> json) => Photo(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );
}
