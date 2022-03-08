// ignore_for_file: avoid_print

import 'dart:io';

import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class ImagePicked extends GetxController {
  var image = ''.obs;
  final ImagePicker _picker = ImagePicker();
  Future getImage() async {
    final XFile? _image = await _picker.pickImage(source: ImageSource.camera);
    if (_image != null) {
      image.value = _image.path;
      update();
      print('Image:$image');
    } else {
      print('D\'not Select your image');
    }
  }
}
