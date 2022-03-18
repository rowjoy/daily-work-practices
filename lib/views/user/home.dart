// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../helper/get_storage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: InkWell(
              onTap: () {},
              child: Text('Wlcome to home page'),
            ),
          ),
        ),
      ),
    );
  }
}
