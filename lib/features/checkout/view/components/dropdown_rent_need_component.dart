import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:lappyhub/shared/styles/google_text_style.dart';

class DropdownRentNeedComponent extends StatelessWidget {
  const DropdownRentNeedComponent({
    super.key,
    required this.title,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    required this.iconPath,
  });

  final String title;
  final String selectedValue;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleTextStyle.fw600.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.dark,
            ),
          ),
          12.verticalSpace,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color: ColorStyle.white,
            ),
            child: DropdownButtonFormField(
              isExpanded: true,
              isDense: true,
              value: selectedValue,
              dropdownColor: ColorStyle.white,
              style: GoogleTextStyle.fw500.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.dark,
              ),
              items: items.map((item) {
                return DropdownMenuItem(
                  alignment: Alignment.centerLeft,
                  value: item,
                  child: Text(
                    item,
                    style: item == selectedValue
                        ? GoogleTextStyle.fw500.copyWith(
                            fontSize: 16.sp,
                            color: ColorStyle.dark,
                          )
                        : GoogleTextStyle.fw400.copyWith(
                            color: ColorStyle.grey,
                            fontSize: 16.sp,
                          ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
              decoration: InputDecoration(
                fillColor: ColorStyle.white,
                // filled: true,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14.h,
                  horizontal: 16.w,
                ),
                prefixIcon: UnconstrainedBox(
                  alignment: const Alignment(0.4, 0),
                  child: SvgPicture.asset(
                    iconPath,
                    width: 26.w,
                    height: 26.h,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
