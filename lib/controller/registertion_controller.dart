// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:imagetotext/String/string.dart';
import 'package:imagetotext/model/registration_model.dart';
import 'package:imagetotext/service/api_service.dart';
import 'package:get/get.dart';
import 'package:imagetotext/views/user/home.dart';

class RegistertionController extends GetxController {
  static final numberController = TextEditingController();
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();

  Future postRegister(Registertion registertion) async {
    ApiService.postdata(
      baseUri: Strings.registerBaseUrl,
      uri: Strings.registerUrl,
      data: registertion.toJson(),
    ).then((value) {
      if (value != null) {
        Registertion _registertion = Registertion.fromJson(value);
        // print('UI Id ${value['token']}');
        if (_registertion.email!.isNotEmpty) {
          Get.to(() => HomePage());
        }
      }
    });
  }
}
