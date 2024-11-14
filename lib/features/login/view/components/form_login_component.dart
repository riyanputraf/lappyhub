import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../shared/styles/color_style.dart';
import '../../../../shared/widgets/text_form_custom.dart';
import '../../constants/login_assets_constant.dart';
import '../../controllers/login_controller.dart';

class FormLoginComponent extends StatelessWidget {
  FormLoginComponent({super.key});

  final assetsConstant = LoginAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: LoginController.to.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormFieldCustom(
            icon: assetsConstant.emailIcon,
            controller: LoginController.to.emailController,
            keyboardType: TextInputType.emailAddress,
            initialValue: LoginController.to.emailValue.value,
            label: 'Alamat Email',
            hint: 'Alamat Email',
            isRequired: true,
            requiredText: 'Email address cannot be empty',
          ),
          SizedBox(
            height: 20.h,
          ),
          Obx(
            () => TextFormFieldCustom(
              icon: assetsConstant.passwordIcon,
              controller: LoginController.to.passwordController,
              keyboardType: TextInputType.visiblePassword,
              initialValue: LoginController.to.passwordValue.value,
              label: 'Password',
              hint: 'Password',
              isRequired: true,
              isPassword: LoginController.to.isPassword.value,
              requiredText: 'Password cannot be empty',
              suffixIcon: GestureDetector(
                onTap: () => LoginController.to.showPassword(),
                child: Align(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: Icon(
                    LoginController.to.isPassword.value == true
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
