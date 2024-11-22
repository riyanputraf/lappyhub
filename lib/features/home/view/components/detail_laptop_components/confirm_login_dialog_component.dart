import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/shared/widgets/button_primary_custom.dart';

import '../../../../../configs/routes/route.dart';
import '../../../../../shared/styles/color_style.dart';
import '../../../../../shared/styles/google_text_style.dart';

class ConfirmLoginDialogComponent extends StatelessWidget {
  const ConfirmLoginDialogComponent({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          28.verticalSpace,
          ColorFiltered(
            colorFilter:
                ColorFilter.mode(ColorStyle.softGrey, BlendMode.modulate),
            child: Image.asset(
              image,
              height: 250.h,
              width: 350.w,
              fit: BoxFit.fitHeight,
            ),
          ),
          Text(
            'Login untuk melanjutkan',
            style: GoogleTextStyle.fw600.copyWith(
              fontSize: 22.sp,
              color: ColorStyle.dark,
            ),
            textAlign: TextAlign.center,
          ),
          10.verticalSpace,
          Text(
            'Anda harus login terlebih dahulu untuk ke halaman checkout',
            style: GoogleTextStyle.fw400.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.grey,
            ),
            textAlign: TextAlign.center,
          ),
          14.verticalSpace,
          ButtonPrimaryCustom(
            text: 'Login',
            onTap: () {
              Get.back();
              Get.toNamed(Routes.loginRoute);
            },
          ),
          10.verticalSpace,
          ButtonPrimaryCustom(
            color: ColorStyle.white,
            textColor: ColorStyle.dark,
            text: 'Kembali',
            onTap: () {
              Get.back();
            },
          ),
          5.verticalSpace,
        ],
      ),
    );
  }
}
