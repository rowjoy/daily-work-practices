import 'package:flutter/cupertino.dart';
import 'package:imagetotext/String/string.dart';
import 'package:imagetotext/model/registration_model.dart';
import 'package:imagetotext/service/api_service.dart';
import 'package:get/get.dart';

class RegistertionController extends GetxController {
  static final numberController = TextEditingController();
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();

  Future postRegister(Registertion registertion) async {
    ApiService.postdata(
      baseUri: Strings.registerBaseUrl,
      uri: Strings.registerUrl,
      data: registertion.toJson(),
    );
  }
}
