import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/login/controllers/login_controller.dart';
import 'package:lappyhub/features/profile/controllers/profile_controller.dart';
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
      body: Obx(() {
        if (LoginController.to.isLoggedIn.value) {
          return Center(
            child: Column(
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
                ButtonPrimaryCustom(
                  text: 'Logout',
                  color: ColorStyle.danger,
                  onTap: () async {
                    await ProfileController.to.logout();
                  },
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: ButtonPrimaryCustom(
              text: 'Login disini',
              onTap: () {
                Get.toNamed(Routes.loginRoute);
              },
            ),
          );
        }
      }),
    );
  }
}
