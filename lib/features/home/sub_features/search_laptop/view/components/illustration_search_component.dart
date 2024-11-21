import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../shared/styles/color_style.dart';
import '../../../../../../shared/styles/google_text_style.dart';

class IllustrationSearchComponent extends StatelessWidget {
  const IllustrationSearchComponent({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorFiltered(
            colorFilter:
                ColorFilter.mode(ColorStyle.softGrey, BlendMode.modulate),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Image.asset(
                image,
                height: 250.h,
                width: 250.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          10.verticalSpace,
          Text(
            'Cari Laptop \nKesayangan Anda Disini',
            textAlign: TextAlign.center,
            style: GoogleTextStyle.fw400.copyWith(
              fontSize: 20.sp,
              color: ColorStyle.dark,
            ),
          ),
        ],
      ),
    );
  }
}
