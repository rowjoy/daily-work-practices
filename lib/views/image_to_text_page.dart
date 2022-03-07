// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unnecessary_null_comparison
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:imagetotext/service/image_picker_service.dart';

class ImageToTextPage extends StatefulWidget {
  const ImageToTextPage({Key? key}) : super(key: key);

  @override
  _ImageToTextPageState createState() => _ImageToTextPageState();
}

class _ImageToTextPageState extends State<ImageToTextPage> {
  final ImagePicked _imagePicked = Get.put(ImagePicked());
//  Future<List<RecognisedText>> getText(String path) async {
//     final inputImage = InputImage.fromFilePath(path);
//     final textDetector = GoogleMlKit.vision.textDetector();
//     final RecognisedText recognisedText =
//         await textDetector.processImage(inputImage);

//     List<RecognisedText> recognizedList = [];

//     for (TextBlock block in recognisedText.blocks) {
//       recognizedList.add(
//          (lines: block.lines, block: block.text.toLowerCase()));
//     }

//     return recognizedList;
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => (Container(
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
                    },
                    child: Text('Pick Image'),
                  ),
                  InkWell(
                    onTap: () {},
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
