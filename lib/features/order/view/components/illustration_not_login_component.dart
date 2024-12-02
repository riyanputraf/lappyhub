import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/styles/color_style.dart';
import '../../../../shared/styles/google_text_style.dart';
import '../../../../shared/widgets/button_primary_custom.dart';

class IllustrationNotLoginComponent extends StatelessWidget {
  const IllustrationNotLoginComponent({
    super.key,
    required this.image,
    required this.onTap,
  });

  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 80.h),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorFiltered(
              colorFilter:
                  ColorFilter.mode(ColorStyle.softGrey, BlendMode.modulate),
              child: Image.asset(
                image,
                height: 345.h,
                width: 345.w,
                fit: BoxFit.fitHeight,
              ),
            ),
            10.verticalSpace,
            Text(
              'Login untuk melihat halaman ini',
              style: GoogleTextStyle.fw600.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.dark,
              ),
            ),
            10.verticalSpace,
            Text(
              'Anda harus login terlebih dahulu untuk melihat halaman ini',
              style: GoogleTextStyle.fw400.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.grey,
              ),
              textAlign: TextAlign.center,
            ),
            20.verticalSpace,
            ButtonPrimaryCustom(
              text: 'Login',
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
