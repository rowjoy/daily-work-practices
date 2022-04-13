// To parse this JSON data, do
//
//     final albumModel = albumModelFromJson(jsonString);

// import 'dart:convert';

// List<AlbumModel> albumModelFromJson(String str) =>
//     List<AlbumModel>.from(json.decode(str).map((x) => AlbumModel.fromJson(x)));

// String albumModelToJson(List<AlbumModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumModel {
  AlbumModel({
    this.userId,
    this.id,
    this.title,
  });

  int? userId;
  int? id;
  String? title;

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}
