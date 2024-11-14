import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/register/repositories/register_repository.dart';
import 'package:lappyhub/shared/styles/color_style.dart';


class RegisterController extends GetxController {
  static RegisterController get to => Get.find();

  late final RegisterRepository registerRepository;

  @override
  void onInit() {
    super.onInit();
    registerRepository = RegisterRepository();
  }

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var emailValue = ''.obs;
  var passwordController = TextEditingController();
  var passwordValue = ''.obs;
  var nameController = TextEditingController();
  var nameValue = ''.obs;
  var pinController = TextEditingController();
  var pinValue = ''.obs;
  var isPassword = true.obs;
  var isLoading = false.obs;

  // Form Password show
  void showPassword() {
    if (isPassword.value == true) {
      isPassword.value = false;
    } else {
      isPassword.value = true;
    }
  }

  Future<void> register(context) async {
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
      var user = await registerRepository.register(
        emailController.text.trim(),
        passwordController.text.trim(),
        nameController.text.trim(),
        pinController.text.trim(),
      );

      if (user != null) {
        EasyLoading.instance.backgroundColor = ColorStyle.success;
        EasyLoading.showSuccess('Registration Success');
        Get.offAllNamed(
            '/login'); // Navigasi ke halaman login setelah berhasil registrasi
      } else {
        EasyLoading.instance.backgroundColor = ColorStyle.danger;
        EasyLoading.showError(
          'Registration Failed',
        );
      }
    }
  }
}
