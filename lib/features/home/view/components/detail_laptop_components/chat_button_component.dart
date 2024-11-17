import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:lappyhub/shared/styles/google_text_style.dart';

class ChatButtonComponent extends StatelessWidget {
  const ChatButtonComponent({
    super.key,
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Material(
        borderRadius: BorderRadius.circular(50.r),
        color: ColorStyle.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(50.r),
          onTap: () {},
          child: SizedBox(
            width: double.infinity,
            height: 52.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  width: 24.w,
                  height: 24.h,
                ),
                10.horizontalSpace,
                Text(
                  'Kirim Pesan',
                  style: GoogleTextStyle.fw600.copyWith(
                    fontSize: 16.sp,
                    color: ColorStyle.dark,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
