import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/styles/color_style.dart';
import '../../../../shared/styles/google_text_style.dart';

class CategoryCardComponent extends StatelessWidget {
  final String name;
  final String iconPath;

  const CategoryCardComponent({
    Key? key,
    required this.name,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      width: 139.w,
      margin: EdgeInsets.only(right: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            height: 46.h,
            width: 46.w,
            decoration: BoxDecoration(
              color: ColorStyle.softGrey,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              iconPath,
              height: 24.h,
              width: 24.w,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            name,
            style: GoogleTextStyle.fw600.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.dark,
            ),
          ),
        ],
      ),
    );
  }
}
