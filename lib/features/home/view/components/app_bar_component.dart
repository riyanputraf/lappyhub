import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lappyhub/shared/styles/color_style.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String logoPath;
  final String icon;

  const AppBarComponent({
    Key? key,
    required this.logoPath,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          logoPath,
          height: 45.h,
          fit: BoxFit.fitHeight,
        ),
        centerTitle: false,
        actions: [
          Container(
            height: 46.h,
            width: 46.w,
            decoration: BoxDecoration(
              color: ColorStyle.white,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              icon,
              height: 24.h,
              width: 24.w,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}