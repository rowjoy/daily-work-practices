// To parse this JSON data, do
//
//     final userPostModel = userPostModelFromJson(jsonString);

import 'dart:convert';

// List<UserPostModel> userPostModelFromJson(String str) =>
//     List<UserPostModel>.from(
//         json.decode(str).map((x) => UserPostModel.fromJson(x)));

// String userPostModelToJson(List<UserPostModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserPostModel {
  UserPostModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory UserPostModel.fromJson(Map<String, dynamic> json) => UserPostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
