// ignore_for_file: public_member_api_docs, avoid_setters_without_getters

import 'dart:io';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

///
class ImageCropController extends GetxController {
  final _pickedFile = XFile('').obs;

  CroppedFile? _croppedFile;

  final _picker = ImagePicker().obs;

  String get pickedFilePath => _pickedFile.value.path;

  XFile get pickedFile => _pickedFile.value;

  CroppedFile? get croppedFile => _croppedFile;

  set setCroppedFile(CroppedFile? value) => {_croppedFile = value, refresh()};

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.value.getImage(source: source);
    if (pickedFile != null) {
      _pickedFile.value = XFile(pickedFile.path);
      refresh();
      print(pickedFile.path);
    }
  }

  void clear() {
    _pickedFile.value = XFile('');

    setCroppedFile = null;
  }

  void sendImageFileToEditProdut() {
    File file = File('');
    if (croppedFile != null) {
      file = File(croppedFile!.path);
    } else if (pickedFile.path.isNotEmpty) {
      file = File(pickedFile.path);
    }

    Get.back(result: file);
  }
}
