// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';

import 'package:get/get.dart';
import 'package:imagetotext/String/string.dart';
import 'package:imagetotext/model/user_comment_model.dart';
import 'package:imagetotext/service/api_service.dart';
import 'package:http/http.dart' as http;

class UserCommentController extends GetxController {
  late Future<List<UserCommentModel>> getCommentdata;
  Future<List<UserCommentModel>> getComment() async {
    final responce = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
    if (responce.statusCode == 200) {
      List data = jsonDecode(responce.body);
      return data.map((e) => UserCommentModel.fromJson(e)).toList();
    } else {
      throw Exception("Problem");
    }
    // List json = [];
    // ApiService.getdata(baseUrl: Strings.fackurl, url: Strings.comment)
    //     .then((value) {
    //   for (var i in value) {
    //     json.add(UserCommentModel.fromJson(i));
    //     print(json);
    //     return json.map((e) => UserCommentModel.fromJson(e)).toList();
    //   }
    // }).onError((error, stackTrace) {
    //   throw Exception(" $error");
    // });
  }

  @override
  void onInit() {
    getCommentdata = getComment();
    print("Hello----${getComment()}");
    super.onInit();
  }
}
