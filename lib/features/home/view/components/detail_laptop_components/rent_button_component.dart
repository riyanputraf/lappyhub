import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:lappyhub/shared/styles/google_text_style.dart';

import '../../../../../shared/widgets/button_primary_custom.dart';
import '../../../../../shared/widgets/currency_format_custom.dart';
import '../../../models/laptop_detail_model.dart';

class RentButtonComponent extends StatelessWidget {
  const RentButtonComponent({
    super.key,
    required this.laptop,
  });

  final LaptopDetailModel laptop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        height: 88.h,
        decoration: BoxDecoration(
          color: ColorStyle.softDark,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    CurrencyFormat.convertToIdr(int.parse(laptop.price), 0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleTextStyle.fw700.copyWith(
                      fontSize: 26.sp,
                      color: ColorStyle.white,
                    ),
                  ),
                  Text(
                    '/hari',
                    style: GoogleTextStyle.fw400.copyWith(
                      fontSize: 14.sp,
                      color: ColorStyle.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 160.w,
              child: ButtonPrimaryCustom(
                text: 'Sewa Sekarang',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
