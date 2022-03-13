// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:imagetotext/String/string.dart';
import 'package:imagetotext/model/login_model.dart';
import 'package:imagetotext/service/api_service.dart';
import 'package:imagetotext/views/user/home.dart';

class LoginController extends GetxController {
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  Future loginPost(Login login) async {
    ApiService.postdata(
      baseUri: Strings.loginBaseUrl,
      uri: Strings.loginUrl,
      data: login.toJson(),
    ).then((data) {
      if (data['message'] != null) {
        Login _login = Login.fromJson(data);
        if (_login.email!.isNotEmpty) {
          Get.to(() => HomePage());
        }
      }
    });
  }
}
