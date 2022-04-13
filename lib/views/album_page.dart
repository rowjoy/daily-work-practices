// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagetotext/controller/album_controller.dart';
import 'package:imagetotext/model/album_model.dart';

class AlbumPage extends StatelessWidget {
  AlbumPage({Key? key}) : super(key: key);
  final _controller = Get.put(AlbumController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<AlbumModel>>(
          future: _controller.getAlbumdata(),
          builder: (context, snapShot) {
            if (snapShot.hasError) {
              // ignore: avoid_print
              print(snapShot.error);
              return Center(child: Text("Data is not found"));
            }
            if (snapShot.hasData) {
              List<AlbumModel>? data = snapShot.data;
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              colors: [Colors.deepOrangeAccent, Colors.orange],
                            ),
                          ),
                          child: ListTile(
                            title: Text("${data[index].title}"),
                          ),
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
