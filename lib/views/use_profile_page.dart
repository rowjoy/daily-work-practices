// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagetotext/controller/user_controller.dart';
import 'package:imagetotext/controller/user_post_controller.dart';
import 'package:imagetotext/model/user_model.dart';

class UserProfilepage extends StatelessWidget {
  UserProfilepage({Key? key}) : super(key: key);
  final _userProfile = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<UserModel>>(
          future: _userProfile.getuserdata(),
          builder: (context, snapSort) {
            if (snapSort.hasData) {
              List<UserModel>? data = snapSort.data;
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            CircleAvatar(child: Text("${data[index].id}")),
                            Text("${data[index].name}" +
                                "(${data[index].username})"),
                            Text("${data[index].email}"),
                            Text("${data[index].phone}"),
                            Text("${data[index].company!.name}"),
                            Text("${data[index].company!.bs}"),
                            Text("${data[index].company!.catchPhrase}"),
                            Text("Website : " + "${data[index].website}"),
                            Text("${data[index].address!.city}"),
                            Text("${data[index].address!.zipcode}")
                          ],
                        ),
                      ),
                    );
                  });
            }
            return Center(child: Text("Lodding...."));
          },
        ),
      ),
    );
  }
}
