import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/styles/color_style.dart';
import '../../../../shared/styles/google_text_style.dart';

class SectionHeaderComponent extends StatelessWidget {
  const SectionHeaderComponent({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleTextStyle.fw700.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.dark,
            ),
          ),
        ],
      ),
    );
  }
}
