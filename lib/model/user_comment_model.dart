// To parse this JSON data, do
//
//     final userCommentModel = userCommentModelFromJson(jsonString);

// List<UserCommentModel> userCommentModelFromJson(String str) =>
//     List<UserCommentModel>.from(
//         json.decode(str).map((x) => UserCommentModel.fromJson(x)));

// String userCommentModelToJson(List<UserCommentModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserCommentModel {
  UserCommentModel({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  factory UserCommentModel.fromJson(Map<String, dynamic> json) =>
      UserCommentModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
