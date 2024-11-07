import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/features/splash/constants/splash_assets_constant.dart';

import '../../../../shared/styles/color_style.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final assetsConstant = SplashAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white,
      body: Center(
        child: Image.asset(
          assetsConstant.lappyHubLogo,
          width: 270.w,
          height: 220.h,
        ),
      ),
    );
  }
}
