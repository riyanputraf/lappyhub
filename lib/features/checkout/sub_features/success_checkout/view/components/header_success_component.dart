import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../shared/styles/color_style.dart';
import '../../../../../../shared/styles/google_text_style.dart';

class HeaderSuccesComponent extends StatelessWidget {
  const HeaderSuccesComponent({
    super.key,
    required this.title,
    required this.status,
    required this.subTitle,
  });

  final String title;
  final String status;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            text: title,
            style: GoogleTextStyle.fw700.copyWith(
              fontSize: 32.sp,
              color: ColorStyle.dark,
            ),
            children: [
              TextSpan(
                text: ' $status',
                style: GoogleTextStyle.fw700.copyWith(
                  fontSize: 32.sp,
                  color: ColorStyle.success,
                ),
              )
            ],
          ),
        ),
        Text(
          subTitle,
          style: GoogleTextStyle.fw700.copyWith(
            fontSize: 32.sp,
            color: ColorStyle.dark,
          ),
        ),
      ],
    );
  }
}
