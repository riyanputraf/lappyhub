import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles/color_style.dart';
import '../styles/google_text_style.dart';

class InputDialogCustom extends StatelessWidget {
  const InputDialogCustom({
    super.key,
    required this.icon,
    required this.hint,
    required this.controller,
    this.obsecure,
    this.enable = true,
    this.onTapBox,
    required this.keyboardType,
    this.isPassword = false,
    this.isRequired = false,
    this.requiredText = "Input type tidak boleh kosong",
    this.maxLength,
    this.initialValue,
    required this.label,
    this.suffixIcon,
  });

  final String icon;
  final String hint;
  final TextEditingController controller;
  final bool? obsecure;
  final bool enable;
  final VoidCallback? onTapBox;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool isRequired;
  final String requiredText;
  final int? maxLength;
  final String? initialValue;
  final String label;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: GoogleTextStyle.fw600.copyWith(
            fontSize: 16.sp,
            color: ColorStyle.dark,
          ),
        ),
        12.verticalSpace,
        GestureDetector(
          onTap: onTapBox,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: isPassword,
            maxLength: maxLength,
            initialValue: initialValue,
            decoration: InputDecoration(
              enabled: enable,
              hintText: hint,
              hintStyle: GoogleTextStyle.fw400.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.grey,
              ),
              counterText: "",
              fillColor: ColorStyle.white,
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 14.h,
                horizontal: 16.w,
              ),
              suffixIcon: suffixIcon,
              prefixIcon: UnconstrainedBox(
                alignment: const Alignment(0.4, 0),
                child: SvgPicture.asset(
                  icon,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
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
            validator: (String? value) {
              if (isRequired == true) {
                String trim = value!.trim();
                if (trim.isEmpty) {
                  return requiredText;
                }
              }
              return null;
            },
            style: GoogleTextStyle.fw600.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.dark,
            ),
          ),
        ),
      ],
    );
  }
}
