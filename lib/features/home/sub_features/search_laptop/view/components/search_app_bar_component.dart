import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/features/home/sub_features/search_laptop/view/components/search_text_form_field_component.dart';

import '../../../../../../shared/styles/color_style.dart';


class SearchAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  const SearchAppBarComponent({
    super.key,
    required this.searchController,
    required this.onSubmitted,
    required this.icon,
    required this.hint,
    this.onBackPressed,
  });

  final TextEditingController searchController;
  final ValueChanged<String> onSubmitted;
  final String icon;
  final String hint;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Container(
          color: ColorStyle.softGrey,
          padding: EdgeInsets.only(
            top: 30.h,
            left: 24.w,
            right: 24.w,
          ),
          child: Row(
            children: [
              GestureDetector(
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
              12.horizontalSpace,
              Expanded(
                child: SearchTextFormFieldComponent(
                  searchController: searchController,
                  onSubmitted: onSubmitted,
                  icon: icon,
                  hint: hint,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
