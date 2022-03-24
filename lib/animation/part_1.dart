// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationPart1 extends StatefulWidget {
  const AnimationPart1({Key? key}) : super(key: key);

  @override
  State<AnimationPart1> createState() => _AnimationPart1State();
}

class _AnimationPart1State extends State<AnimationPart1> {
  bool selected = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        selected = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 300,
                  width: Get.width,
                  color: Colors.red,
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        child: AnimatedAlign(
                          alignment: selected == true
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          duration: const Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn,
                          child: selected == false
                              ? SizedBox()
                              : Text(
                                  "Jamirul islam",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 150,
                        height: 40,
                        child: AnimatedAlign(
                          alignment: selected == true
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          duration: Duration(seconds: 2),
                          curve: Curves.easeIn,
                          child: selected == false
                              ? SizedBox()
                              : Text(
                                  "Joy",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  onPressed: () {},
                  child: AnimatedAlign(
                    alignment: Alignment.topCenter,
                    duration: Duration(seconds: 6),
                    child: Text(
                      "Welcome",
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
