import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:lappyhub/shared/styles/google_text_style.dart';

class SpecificationItem extends StatelessWidget {
  final String title;
  final String description;

  const SpecificationItem({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: RichText(
        text: TextSpan(
          text: '$title: ', // Bagian judul
          style: GoogleTextStyle.fw500.copyWith(
            fontSize: 16.sp,
            color: ColorStyle.dark,
          ),
          children: [
            TextSpan(
              text: description, // Bagian keterangan
              style: GoogleTextStyle.fw400.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.dark,
              )
            ),
          ],
        ),
      ),
    );
  }
}