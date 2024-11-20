import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:lappyhub/shared/styles/google_text_style.dart';

class ButtonPrimaryCustom extends StatelessWidget {
  const ButtonPrimaryCustom({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50.r),
      color: ColorStyle.primary,
      child: InkWell(
        borderRadius: BorderRadius.circular(50.r),
        onTap: onTap,
        child: SizedBox(
          width: double.infinity,
          height: 52.h,
          child: Center(
            child: Text(
              text,
              style: GoogleTextStyle.fw700.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
