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
import '../components/info_profile_component.dart';
import '../components/profile_item_component.dart';

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
        child: Obx(
          () {
            if (ProfileController.to.isLogin.value == false) {
              return IllustrationNotLoginComponent(
                image: assetsConstant.notLoginImage,
                onTap: () {
                  Get.toNamed(Routes.loginRoute);
                },
              );
            }
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InfoProfileComponent(),
                        40.verticalSpace,
                        ProfileItemComponent(
                          name: 'Edit Profil',
                          icon: assetsConstant.personIcon,
                          onTap: (){
                            Get.toNamed(Routes.editProfileRoute);
                          },
                        ),
                        20.verticalSpace,
                        ProfileItemComponent(
                          name: 'Beri Penilaian',
                          icon: assetsConstant.ratingIcon,
                        ),
                        20.verticalSpace,
                        ProfileItemComponent(
                          name: 'Tentang Aplikasi',
                          icon: assetsConstant.deviceIcon,
                          onTap: (){
                            Get.toNamed(Routes.aboutAppRoute);
                          },
                        ),
                        20.verticalSpace,
                        ProfileItemComponent(
                          name: 'Sosial Media Kami',
                          icon: assetsConstant.globeIcon,
                          onTap: (){
                            Get.toNamed(Routes.socialMediaRoute);
                          },
                        ),
                      ],
                    ),
                  ),
                  20.verticalSpace,
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
          },
        ),
      ),
    );
  }
}
