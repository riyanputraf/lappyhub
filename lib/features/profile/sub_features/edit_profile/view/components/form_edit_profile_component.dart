import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/features/profile/sub_features/edit_profile/controllers/edit_profile_controller.dart';

import '../../../../../../shared/widgets/text_form_custom.dart';
import '../../../../constants/profile_assets_constant.dart';

class FormEditProfileComponent extends StatelessWidget {
  FormEditProfileComponent({super.key});

  final assetsConstant = ProfileAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: EditProfileController.to.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormFieldCustom(
            icon: assetsConstant.personIcon,
            controller: EditProfileController.to.nameController,
            initialValue: EditProfileController.to.nameValue.value,
            keyboardType: TextInputType.emailAddress,
            label: 'Nama Lengkap',
            hint: 'Nama Anda',
            isRequired: true,
            requiredText: 'Name cannot be empty',
          ),
          20.verticalSpace,
          TextFormFieldCustom(
            icon: assetsConstant.emailIcon,
            controller: EditProfileController.to.emailController,
            initialValue: EditProfileController.to.emailValue.value,
            keyboardType: TextInputType.emailAddress,
            label: 'Alamat Email',
            hint: 'Alamat Email',
            isRequired: true,
            requiredText: 'Email address cannot be empty',
          ),
        ],
      ),
    );
  }
}
