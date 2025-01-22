import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:lappyhub/shared/styles/google_text_style.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    super.key,
    required this.title,
    this.onBackPressed,
    this.hasAction = false,
    this.onActionPressed,
  });

  final String title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onActionPressed;
  final bool hasAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      child: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12.r),
          ),
        ),
        flexibleSpace: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(12.r),
            ),
            color: Colors.transparent,
          ),
        ),
        automaticallyImplyLeading: false,
        clipBehavior: Clip.none,
        scrolledUnderElevation: 0,
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleTextStyle.fw700.copyWith(
            fontSize: 16.sp,
            color: ColorStyle.dark,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: onBackPressed,
          child: Container(
            height: 46.h,
            width: 46.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.chevron_left,
              size: 24.r,
            ),
          ),
        ),
        actions: hasAction
            ? [
                GestureDetector(
                  onTap: onActionPressed,
                  child: Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.check,
                      size: 24.r,
                      color: ColorStyle.success,
                    ),
                  ),
                ),
              ]
            : null,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
