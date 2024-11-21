import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/login/repositories/login_repository.dart';

import '../../../shared/styles/color_style.dart';
import '../../../utils/services/hive_service.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var emailValue = ''.obs;
  var passwordController = TextEditingController();
  var passwordValue = ''.obs;
  var isPassword = true.obs;

  late final LoginRepository loginRepository;

  var isLoggedIn = HiveService.isLoggedIn().obs;

  @override
  void onInit() {
    super.onInit();
    loginRepository = LoginRepository();
  }

  // Form Password show
  void showPassword() {
    if (isPassword.value == true) {
      isPassword.value = false;
    } else {
      isPassword.value = true;
    }
  }

  void checkLoginStatus() {
    isLoggedIn.value = HiveService.isLoggedIn();
  }

  Future<void> login(context) async {
    var isValid = formKey.currentState!.validate();
    Get.focusScope!.unfocus();

    if (isValid) {
      EasyLoading.instance.backgroundColor = ColorStyle.primary;
      EasyLoading.show(
        status: 'Sedang Diproses...',
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
      );
      formKey.currentState!.save();
      var user = await loginRepository.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (user != null) {
        await HiveService.setAuth(user);
        EasyLoading.instance.backgroundColor = ColorStyle.success;
        isLoggedIn.value = true;
        EasyLoading.showSuccess('Login Success');
        Get.back();
      } else {
        EasyLoading.dismiss();
      }
    }
  }
}
