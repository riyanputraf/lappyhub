import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/styles/color_style.dart';
import '../../../../shared/styles/google_text_style.dart';

class NotFoundStatusIllustrationComponent extends StatelessWidget {
  const NotFoundStatusIllustrationComponent({
    super.key,
    required this.image,
  });

  final String image;

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
              'Status pesanan tidak ditemukan',
              style: GoogleTextStyle.fw600.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.dark,
              ),
            ),
            10.verticalSpace,
            Text(
              'Status pesanan tidak ditemukan harap cari status pesanan lain',
              style: GoogleTextStyle.fw400.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
