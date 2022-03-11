import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:imagetotext/String/string.dart';
import 'package:imagetotext/model/login_model.dart';
import 'package:imagetotext/service/api_service.dart';

class LoginController extends GetxController {
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  var isloading = true.obs;
  Future loginPost(Login login) async {
    ApiService.postdata(
      baseUri: Strings.loginBaseUrl,
      uri: Strings.loginUrl,
      data: login.toJson(),
    );
    isloading = false.obs;
  }
}
