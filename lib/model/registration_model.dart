// To parse this JSON data, do
//
//     final registertion = registertionFromJson(jsonString);

import 'dart:convert';

Registertion registertionFromJson(String str) =>
    Registertion.fromJson(json.decode(str));

String registertionToJson(Registertion data) => json.encode(data.toJson());

class Registertion {
  Registertion({
    this.mobileNumber,
    this.email,
    this.password,
  });

  String? mobileNumber;
  String? email;
  String? password;

  factory Registertion.fromJson(Map<String, dynamic> json) => Registertion(
        mobileNumber: json["mobileNumber"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "mobileNumber": mobileNumber,
        "email": email,
        "password": password,
      };
}
