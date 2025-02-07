import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:lappyhub/shared/styles/google_text_style.dart';

class SummaryItemCheckoutComponent extends StatelessWidget {
  const SummaryItemCheckoutComponent({
    super.key,
    required this.title,
    required this.value,
    this.subTitle,
    this.valueStyle,
  });

  final String title;
  final String value;
  final String? subTitle;
  final TextStyle? valueStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleTextStyle.fw400.copyWith(
              fontSize: 14.sp,
              color: ColorStyle.dark,
            ),
          ),
          Row(
            children: [
              Text(
                value,
                style: valueStyle ?? GoogleTextStyle.fw500.copyWith(
                  fontSize: 16.sp,
                  color: ColorStyle.dark,
                ),
              ),
              if (subTitle != null)
                Text(
                  '$subTitle',
                  style: GoogleTextStyle.fw400.copyWith(
                    fontSize: 16.sp,
                    color: ColorStyle.grey,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
