import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/features/checkout/sub_features/payment/models/payment_model.dart';

import '../../../../../../shared/styles/color_style.dart';
import '../../../../../../shared/styles/google_text_style.dart';

class PaymentCardComponent extends StatelessWidget {
  const PaymentCardComponent({
    super.key,
    this.onTap,
    required this.isSelected,
    required this.payment,
  });

  final VoidCallback? onTap;
  final bool isSelected;
  final PaymentModel payment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(
            color: isSelected ? ColorStyle.primary : Colors.transparent,
            width: 2.w,
          ),
        ),
        child: Row(
          children: [
            Image.network(
              payment.icon,
              height: 40.h,
              width: 40.w,
            ),
            SizedBox(width: 16.w),
            Text(
              payment.name,
              style: GoogleTextStyle.fw400.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.dark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
