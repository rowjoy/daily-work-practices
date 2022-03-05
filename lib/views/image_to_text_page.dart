// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageToTextPage extends StatefulWidget {
  const ImageToTextPage({Key? key}) : super(key: key);

  @override
  _ImageToTextPageState createState() => _ImageToTextPageState();
}

class _ImageToTextPageState extends State<ImageToTextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Center(child: Text('Select Image')),
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
                    onPressed: () {},
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
