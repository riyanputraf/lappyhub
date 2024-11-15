import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:lappyhub/shared/styles/google_text_style.dart';

class NavigationItemComponent extends StatelessWidget {
  const NavigationItemComponent({
    super.key,
    required this.label,
    required this.icon,
    required this.iconOn,
    required this.onTap,
    this.isActive = false,
    this.hasDot = false,
  });

  final String label;
  final String icon;
  final String iconOn;
  final bool isActive;
  final VoidCallback onTap;
  final bool hasDot;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          height: 46.h,
          child: Column(
            children: [
              SvgPicture.asset(
                isActive ? iconOn : icon,
                height: 24.h,
                width: 24.w,
              ),
              4.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: GoogleTextStyle.fw600.copyWith(
                      fontSize: 12.sp,
                      color: isActive ? ColorStyle.primary : ColorStyle.grey
                    )
                  ),
                  if (hasDot)
                    Container(
                      margin: EdgeInsets.only(left: 2.w),
                      height: 6.h,
                      width: 6.w,
                      decoration: BoxDecoration(
                        color: ColorStyle.danger,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
