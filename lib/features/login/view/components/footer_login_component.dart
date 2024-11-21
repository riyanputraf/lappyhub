import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:lappyhub/shared/styles/google_text_style.dart';

class FooterLoginComponent extends StatelessWidget {
  const FooterLoginComponent({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Belum punya akun? ',
            style: GoogleTextStyle.fw400.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.dark,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              'Register',
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
