// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:imagetotext/controller/user_comment_controller.dart';
import 'package:imagetotext/model/user_comment_model.dart';

class CommentPage extends StatelessWidget {
  CommentPage({Key? key}) : super(key: key);
  final UserCommentController _controller = Get.put(UserCommentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<UserCommentModel>>(
            future: _controller.getCommentdata,
            builder: (context, shapshot) {
              if (shapshot.hasData) {
                List<UserCommentModel>? data = shapshot.data;
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text("${data[index].id}"),
                          ),
                          title:
                              Text("${data[index].name}\n${data[index].email}"),
                          subtitle: Text("${data[index].body}"),
                        ),
                      );
                    });
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
