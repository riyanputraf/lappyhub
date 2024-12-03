import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/profile/controllers/profile_controller.dart';
import 'package:lappyhub/features/profile/view/components/illustration_not_login_component.dart';
import 'package:lappyhub/features/profile/view/components/profile_app_bar_component.dart';
import 'package:lappyhub/shared/widgets/button_primary_custom.dart';

import '../../../../configs/routes/route.dart';
import '../../../../shared/styles/color_style.dart';
import '../../../../utils/services/hive_service.dart';
import '../../constants/profile_assets_constant.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final assetsConstant = ProfileAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.softGrey,
      appBar: ProfileAppBarComponent(
        title: 'Profil',
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          if (ProfileController.to.isLogin.value) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      HiveService.get<String>('avatar') ??
                          'avatar'), // Avatar dari Hive
                ),
                16.verticalSpace,
                Text(
                  HiveService.get<String>('name') ?? 'name',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                8.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: ButtonPrimaryCustom(
                    text: 'Logout',
                    color: ColorStyle.danger,
                    onTap: () async {
                      await ProfileController.to.logout();
                    },
                  ),
                ),
              ],
            );
          } else {
            return IllustrationNotLoginComponent(
              image: assetsConstant.notLoginImage,
              onTap: () {
                Get.toNamed(Routes.loginRoute);
              },
            );
          }
        }),
      ),
    );
  }
}
