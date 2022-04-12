// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagetotext/controller/user_post_controller.dart';
import 'package:imagetotext/model/user_post_model.dart';

class Userpostpage extends StatelessWidget {
  Userpostpage({Key? key}) : super(key: key);
  final UserPostController _postController = Get.put(UserPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<UserPostModel>>(
          future: _postController.futuredata,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<UserPostModel>? data = snapshot.data;
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                leading: Text("${data[index].id}"),
                                trailing: Text("${data[index].userId}"),
                                title: Text("${data[index].title}"),
                                subtitle: Text("${data[index].title}"),
                              ),
                            ),
                          ],
                        ));
                  });
            }
            return Center(child: Text("Lodding...."));
          },
        ),
      ),
    );
  }
}
