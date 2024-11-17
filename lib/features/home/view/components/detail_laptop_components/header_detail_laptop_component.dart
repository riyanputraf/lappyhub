import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lappyhub/features/home/models/laptop_detail_model.dart';

import '../../../../../shared/styles/color_style.dart';
import '../../../../../shared/styles/google_text_style.dart';

class HeaderDetailLaptopComponent extends StatelessWidget {
  const HeaderDetailLaptopComponent({
    super.key,
    required this.laptop,
    required this.icon,
    required this.category,
    required this.rating,
  });

  final LaptopDetailModel laptop;
  final String icon;
  final String category;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            laptop.name,
            textAlign: TextAlign.center,
            style: GoogleTextStyle.fw700.copyWith(
              fontSize: 32.sp,
              color: ColorStyle.dark,
            ),
          ),
        ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            10.horizontalSpace,
            Text(
              category,
              style: GoogleTextStyle.fw600.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.dark,
              ),
            ),
            20.horizontalSpace,
            Icon(
              Icons.star_rate,
              color: ColorStyle.warning,
              size: 46.r,
            ),
            Text(
              '${rating}/5',
              style: GoogleTextStyle.fw600.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.dark,
              ),
            ),
          ],
        )
      ],
    );
  }
}
