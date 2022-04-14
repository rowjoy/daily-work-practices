// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imagetotext/animation/part_1.dart';
import 'package:imagetotext/views/album_page.dart';
import 'package:imagetotext/views/comment_page.dart';
import 'package:imagetotext/views/image_to_text_page.dart';
import 'package:imagetotext/views/qr_code_scaner.dart';
import 'package:imagetotext/views/user/login.dart';
import 'package:imagetotext/views/user_post_page.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QrcodeScaner(),
      builder: EasyLoading.init(),
    );
  }
}
