// ignore_for_file: avoid_print

import 'dart:io';

import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imagetotext/helper/get_storage.dart';

class ImagePicked extends GetxController {
  var image = ''.obs;
  final ImagePicker _picker = ImagePicker();
  Future getImage() async {
    final XFile? _image = await _picker.pickImage(source: ImageSource.camera);
    if (_image != null) {
      image.value = _image.path;
      LocalStorage.localStorage.write("Image", image.value);
      update();
      print('Image:$image');
    } else {
      print('D\'not Select your image');
    }
  }
}
