import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:lappyhub/shared/styles/google_text_style.dart';

class SearchNotFoundComponent extends StatelessWidget {
  const SearchNotFoundComponent({
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
            'Laptop Tidak Ditemukan',
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
