import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/styles/color_style.dart';
import '../../../../shared/styles/google_text_style.dart';

class EmptyOrderIllustrationComponent extends StatelessWidget {
  const EmptyOrderIllustrationComponent({
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
              'Belum ada pesanan',
              style: GoogleTextStyle.fw600.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.dark,
              ),
            ),
            10.verticalSpace,
            Text(
              'Anda belum memesan sama sekali, ayo pesan laptop kesayangan anda',
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
