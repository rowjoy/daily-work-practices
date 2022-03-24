// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unnecessary_null_comparison
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:imagetotext/controller/text_to_image_controller.dart';
import 'package:imagetotext/helper/get_storage.dart';
import 'package:imagetotext/service/image_picker_service.dart';

class ImageToTextPage extends StatefulWidget {
  const ImageToTextPage({Key? key}) : super(key: key);

  @override
  _ImageToTextPageState createState() => _ImageToTextPageState();
}

class _ImageToTextPageState extends State<ImageToTextPage> {
  final _imagePicked = Get.put(ImagePicked());
  final _textToImage = Get.put(TextToImage());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => (_textToImage.scanText.isNotEmpty
                    ? Container(
                        child: Center(
                          // ignore: unnecessary_string_interpolations
                          child: Text('${_textToImage.scanText.value}'),
                        ),
                      )
                    : Container(
                        child: _imagePicked.image.isNotEmpty
                            ? Image.file(File('${_imagePicked.image}'))
                            : Center(
                                child: Text('Select Image'),
                              ),
                      )),
              ),
            ),
            Container(
              width: Get.width,
              height: Get.height * 0.2,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await _imagePicked.getImage();
                      if (_imagePicked.image.isNotEmpty) {
                        _textToImage
                            .getText(_imagePicked.image.value)
                            .then((value) {
                          if (value != null) {
                            LocalStorage.localStorage.remove("Image");
                            _imagePicked.image.value = "";
                          }
                        });
                        Get.snackbar('Done', "Image To Text");
                      }
                    },
                    child: Text('Pick Image'),
                  ),
                  InkWell(
                    onTap: () {
                      Clipboard.setData(
                          ClipboardData(text: _textToImage.scanText.value));
                      LocalStorage.localStorage.remove('Image');
                      _textToImage.scanText.value = "";
                      Get.snackbar('Thanks', 'Text Copy Confrom');
                    },
                    child: Icon(
                      Icons.copy_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
