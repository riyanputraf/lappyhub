import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../shared/styles/color_style.dart';
import '../../../../../../shared/styles/google_text_style.dart';

class CategoryNotFoundComponent extends StatelessWidget {
  const CategoryNotFoundComponent({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 200.h,
            width: 200.w,
            fit: BoxFit.fitHeight,
          ),
          10.verticalSpace,
          Text(
            'Category Laptop Tidak Ditemukan',
            style: GoogleTextStyle.fw400.copyWith(
              fontSize: 20.sp,
              color: ColorStyle.dark,
            ),
          ),
        ],
      ),
    );
  }
}
