import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../shared/styles/color_style.dart';
import '../../../../../../shared/widgets/app_bar_custom.dart';
import '../../../../constants/profile_assets_constant.dart';
import '../components/description_app_component.dart';

class AboutAppScreen extends StatelessWidget {
  AboutAppScreen({super.key});

  final assetsConstant = ProfileAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.softGrey,
      appBar: AppBarCustom(
        title: 'Tentang Aplikasi',
        onBackPressed: () => Get.back(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                assetsConstant.logoLappy,
                width: double.infinity,
                height: 150,
              ),
            ),
            SizedBox(height: 30),
            DescriptionAppComponent()
          ],
        ),
      ),
    );
  }
}
