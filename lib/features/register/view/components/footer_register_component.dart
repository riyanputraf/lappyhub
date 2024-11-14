import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../configs/routes/route.dart';
import '../../../../shared/styles/color_style.dart';
import '../../../../shared/styles/google_text_style.dart';

class FooterRegisterComponent extends StatelessWidget {
  const FooterRegisterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sudah punya akun? ',
            style: GoogleTextStyle.fw400.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.dark,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.offNamed(Routes.loginRoute);
            },
            child: Text(
              'Login',
              style: GoogleTextStyle.fw500.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
