import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/register/constants/register_assets_constant.dart';
import 'package:lappyhub/features/register/controllers/register_controller.dart';
import 'package:lappyhub/shared/widgets/input_dialog_custom.dart';

import '../../../../shared/styles/color_style.dart';
import '../../../../shared/widgets/text_form_custom.dart';

class FormRegisterComponent extends StatelessWidget {
  FormRegisterComponent({super.key});

  final assetsConstant = RegisterAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: RegisterController.to.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormFieldCustom(
            icon: assetsConstant.personIcon,
            controller: RegisterController.to.nameController,
            keyboardType: TextInputType.emailAddress,
            initialValue: RegisterController.to.nameValue.value,
            label: 'Nama Lengkap',
            hint: 'Nama Anda',
            isRequired: true,
            requiredText: 'Name cannot be empty',
          ),
          20.verticalSpace,
          TextFormFieldCustom(
            icon: assetsConstant.emailIcon,
            controller: RegisterController.to.emailController,
            keyboardType: TextInputType.emailAddress,
            initialValue: RegisterController.to.emailValue.value,
            label: 'Alamat Email',
            hint: 'Alamat Email',
            isRequired: true,
            requiredText: 'Email address cannot be empty',
          ),
          20.verticalSpace,
          InputDialogCustom(
            icon: assetsConstant.pinIcon,
            hint: 'PIN',
            controller: RegisterController.to.pinController,
            keyboardType: TextInputType.emailAddress,
            isRequired: true,
            requiredText: 'PIN cannot be empty',
            label: 'PIN Anda',
            enable: false,
            onTapBox: () => RegisterController.to.inputPin(),
          ),
          20.verticalSpace,
          Obx(
            () => TextFormFieldCustom(
              icon: assetsConstant.passwordIcon,
              controller: RegisterController.to.passwordController,
              keyboardType: TextInputType.visiblePassword,
              initialValue: RegisterController.to.passwordValue.value,
              label: 'Password',
              hint: 'Password',
              isRequired: true,
              isPassword: RegisterController.to.isPassword.value,
              requiredText: 'Password cannot be empty',
              suffixIcon: GestureDetector(
                onTap: () => RegisterController.to.showPassword(),
                child: Align(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: Icon(
                    RegisterController.to.isPassword.value == true
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 25,
                    color: ColorStyle.grey,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
