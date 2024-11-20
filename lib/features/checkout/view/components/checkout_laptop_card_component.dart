import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/features/home/models/laptop_detail_model.dart';

import '../../../../shared/styles/color_style.dart';
import '../../../../shared/styles/google_text_style.dart';
import '../../../../shared/widgets/currency_format_custom.dart';

class CheckoutLaptopCardComponent extends StatelessWidget {
  const CheckoutLaptopCardComponent({
    super.key,
    this.laptop,
  });

  final LaptopDetailModel? laptop;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.symmetric(
        vertical: 14.h,
        horizontal: 16.w,
      ),
      height: 98.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorStyle.white,
      ),
      child: Row(
        children: [
          Image.network(
            laptop!.image,
            width: 90.w,
            height: 70.h,
            fit: BoxFit.contain,
          ),
          10.horizontalSpace,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  laptop!.name,
                  textAlign: TextAlign.center,
                  style: GoogleTextStyle.fw600.copyWith(
                    fontSize: 16.sp,
                    color: ColorStyle.dark,
                  ),
                ),
                Text(
                  laptop!.category,
                  textAlign: TextAlign.center,
                  style: GoogleTextStyle.fw400.copyWith(
                    fontSize: 14.sp,
                    color: ColorStyle.grey,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                CurrencyFormat.convertToIdr(int.parse(laptop!.price), 0),
                textAlign: TextAlign.center,
                style: GoogleTextStyle.fw700.copyWith(
                  fontSize: 18.sp,
                  color: ColorStyle.primary,
                ),
              ),
              Text(
                '/hari',
                style: GoogleTextStyle.fw400.copyWith(
                  fontSize: 14.sp,
                  color: ColorStyle.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
