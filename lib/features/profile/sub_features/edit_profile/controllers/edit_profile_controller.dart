import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../shared/styles/color_style.dart';
import '../../../../../shared/widgets/image_picker_dialog.dart';
import '../../../../../utils/services/hive_service.dart';

class EditProfileController extends GetxController {
  static EditProfileController get to => Get.find();

  var nameValue = ''.obs;
  var nameController = TextEditingController();
  var emailValue = ''.obs;
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  final Rx<File?> _imageFile = Rx<File?>(null);
  File? get imageFile => _imageFile.value;
  var photoUrl = ''.obs;


  @override
  void onInit() {
    super.onInit();
    nameController.text = HiveService.get<String>('name') ?? 'name';
    emailController.text = HiveService.get<String>('email') ?? 'email';
    nameValue.value = HiveService.get<String>('name') ?? 'name';
    emailValue.value = HiveService.get<String>('email') ?? 'email';
    photoUrl.value = HiveService.get<String>('avatar') ?? 'avatar';
  }

  Future<void> pickImage() async {
    /// Buka dialog untuk sumber gambar
    ImageSource? imageSource = await Get.defaultDialog(
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      content: const ImagePickerDialog(),
    );

    /// pengecekan sumber gambar
    if (imageSource == null) {
      log('Image Source: Null');
      return;
    }

    final pickedFile = await ImagePicker().pickImage(
      source: imageSource,
      imageQuality: 90,
    );

    /// setelah dipilih, akan terbuka crop gambar
    if (pickedFile != null) {
      _imageFile.value = File(pickedFile.path);
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: _imageFile.value!.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper'.tr,
            toolbarColor: ColorStyle.primary,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
          ),
          IOSUiSettings(aspectRatioPresets: [CropAspectRatioPreset.square]),
        ],
      );

      /// Jika gambar telah dipilih, maka akan dimasukkan ke variabel image file, karena ini masih menggunakan local file
      if (croppedFile != null) {
        _imageFile.value = File(croppedFile.path);
      }
    }
  }

}