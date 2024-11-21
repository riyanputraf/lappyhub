import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../shared/styles/color_style.dart';
import '../../../../../../shared/styles/google_text_style.dart';
import '../../controllers/home_search_laptop_controller.dart';

class SearchTextFormFieldComponent extends StatelessWidget {
  const SearchTextFormFieldComponent({
    super.key,
    required this.searchController,
    required this.onSubmitted,
    required this.icon,
    required this.hint,
  });

  final TextEditingController searchController;
  final ValueChanged<String> onSubmitted;
  final String icon;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return TextFormField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleTextStyle.fw400.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.grey,
            ),
            fillColor: ColorStyle.white,
            filled: true,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 14.h,
              horizontal: 12.w,
            ),
            prefixIcon: UnconstrainedBox(
              alignment: const Alignment(0.4, 0),
              child: SvgPicture.asset(
                icon,
                width: 24.w,
                height: 24.h,
              ),
            ),
            suffixIcon: HomeSearchLaptopController.to.searchText.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      searchController.clear();
                      HomeSearchLaptopController.to.searchText.value = '';
                    },
                    icon: Container(
                      height: 20.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                        color: ColorStyle.grey,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.clear,
                        color: ColorStyle.white,
                      ),
                    ),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.r),
              borderSide: BorderSide(
                width: 2.w,
                color: ColorStyle.primary,
              ),
            ),
          ),
          textInputAction: TextInputAction.search,
          onChanged: (value) {
            HomeSearchLaptopController.to.searchText.value = value;
          },
          onFieldSubmitted: onSubmitted,
        );
      },
    );
  }
}
