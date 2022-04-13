import 'dart:convert';

import 'package:get/get.dart';
import 'package:imagetotext/String/string.dart';
import 'package:imagetotext/model/album_model.dart';
import 'package:http/http.dart' as http;

class AlbumController extends GetxController {
  Future<List<AlbumModel>> getAlbumdata() async {
    final responce =
        await http.get(Uri.parse(Strings.fackurl + "/" + Strings.album));
    if (responce.statusCode == 200) {
      List data = jsonDecode(responce.body);
      return data.map((e) => AlbumModel.fromJson(e)).toList();
    } else {
      throw Exception("Problem this item");
    }
  }

  @override
  void onInit() {
    getAlbumdata();
    super.onInit();
  }
}
