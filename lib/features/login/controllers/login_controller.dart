import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var emailValue = ''.obs;
  var passwordController = TextEditingController();
  var passwordValue = ''.obs;
  var isPassword = true.obs;

  // Form Password show
  void showPassword() {
    if (isPassword.value == true) {
      isPassword.value = false;
    } else {
      isPassword.value = true;
    }
  }
}
