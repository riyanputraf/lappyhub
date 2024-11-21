import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/shared/widgets/button_primary_custom.dart';

import '../../../../../configs/routes/route.dart';
import '../../../../../shared/styles/color_style.dart';
import '../../../../../shared/styles/google_text_style.dart';

class ConfirmLoginDialogComponent extends StatelessWidget {
  const ConfirmLoginDialogComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          28.verticalSpace,
          Text(
            'Login untuk checkout?',
            style: GoogleTextStyle.fw400.copyWith(
              fontSize: 22.sp,
              color: ColorStyle.dark,
            ),
            textAlign: TextAlign.center,
          ),
          14.verticalSpace,
          ButtonPrimaryCustom(
            text: 'Login Untuk Melanjutkan',
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
