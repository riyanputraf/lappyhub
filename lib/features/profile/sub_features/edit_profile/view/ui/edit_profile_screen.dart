import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../shared/styles/color_style.dart';
import '../../../../../../shared/widgets/app_bar_custom.dart';
import '../components/edit_photo_profile_component.dart';
import '../components/form_edit_profile_component.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.softGrey,
      appBar: AppBarCustom(
        title:
        'Edit Profile',
        onBackPressed: () => Get.back(),
        hasAction: true,
        onActionPressed: (){},
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        child: Column(
          children: [
            EditPhotoProfileComponent(),
            32.verticalSpace,
            FormEditProfileComponent(),
          ],
        ),
      ),
    );
  }
}
