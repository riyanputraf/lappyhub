import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/shared/styles/google_text_style.dart';

import '../../../../shared/styles/color_style.dart';

class OrderAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  const OrderAppBarComponent({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Container(
          color: ColorStyle.softGrey,
          padding: EdgeInsets.only(
            top: 30.h,
            left: 24.w,
            right: 24.w,
          ),
          child: Text(
            title,
            style: GoogleTextStyle.fw700.copyWith(
              fontSize: 24.sp,
              color: ColorStyle.dark,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
