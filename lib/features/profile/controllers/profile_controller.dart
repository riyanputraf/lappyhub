import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../shared/styles/color_style.dart';
import '../../../utils/services/hive_service.dart';
import '../repositories/profile_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  late final ProfileRepository profileRepository;

  var isLogin = false.obs;

  @override
  void onInit() {
    super.onInit();
    profileRepository = ProfileRepository();

    ever(HiveService.isLoggedInStatus, (isLoggedIn) {
      if (isLoggedIn) {
        isLogin.value = true;
      } else {
        isLogin.value = false;
      }
    });
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
      HiveService.setIsLoggedIn(false);
      update();
      EasyLoading.instance.backgroundColor = ColorStyle.success;
      EasyLoading.showSuccess('Logout Success');
    } catch (e, stackTrace) {
      EasyLoading.dismiss();
      log('Logout Error: $e');
      log('Stacktrace Logout Error: $stackTrace');
    }
  }
}
