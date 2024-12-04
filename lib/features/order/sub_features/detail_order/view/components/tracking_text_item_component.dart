import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../shared/styles/google_text_style.dart';

class TrackingTextItemComponent extends StatelessWidget {
  const TrackingTextItemComponent({
    super.key,
    required this.title,
    required this.subTitle,
    required this.textColor,
  });

  final String title;
  final String subTitle;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleTextStyle.fw600.copyWith(
            fontSize: 14.sp,
            color: textColor,
          ),
        ),
        Text(
          subTitle,
          style: GoogleTextStyle.fw400.copyWith(
            fontSize: 14.sp,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
