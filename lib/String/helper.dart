import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helper {
  static showsnackber({String? title, required String message}) {
    Get.snackbar(
      title!,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
