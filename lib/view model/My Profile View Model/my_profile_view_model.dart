import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileViewModel extends ChangeNotifier {
  File? pickedImage;

  /////Image picker/////
  Future<void> pickImage() async {
    debugPrint('Picking Image');
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (image == null) {
      return;
    }
    pickedImage = File(image.path);
    notifyListeners();
  }
}
