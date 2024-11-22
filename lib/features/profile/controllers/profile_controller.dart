import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../shared/styles/color_style.dart';
import '../../login/controllers/login_controller.dart';
import '../repositories/profile_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  late final ProfileRepository profileRepository;

  var isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    profileRepository = ProfileRepository();
    isLoggedIn.value = LoginController.to.isLoggedIn.value;
  }

  Future<void> logout() async {
    EasyLoading.instance.backgroundColor = ColorStyle.primary;
    EasyLoading.show(
      status: 'Logging Out...',
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: false,
    );
    await Future.delayed(const Duration(seconds: 2));

    try {
      await profileRepository.logout();
      LoginController.to.isLoggedIn.value = false; // Update status login
      isLoggedIn.value = LoginController.to.isLoggedIn.value;
      EasyLoading.instance.backgroundColor = ColorStyle.success;
      EasyLoading.showSuccess('Logout Success');
    } catch (e) {
      EasyLoading.dismiss();
      log('Logout Error: $e');
    }
  }
}
