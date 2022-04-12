import 'dart:convert';

import 'package:get/get.dart';
import 'package:imagetotext/model/user_post_model.dart';
import 'package:http/http.dart' as http;

class UserPostController extends GetxController {
  late Future<List<UserPostModel>> futuredata;
  Future<List<UserPostModel>> getpost() async {
    final responce =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (responce.statusCode == 200) {
      List jsondata = jsonDecode(responce.body);
      return jsondata.map((e) => UserPostModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void onInit() {
    futuredata = getpost();
    print("Hello$futuredata");
    super.onInit();
  }
}
