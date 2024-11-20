import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../shared/styles/color_style.dart';
import '../../../../shared/styles/google_text_style.dart';

class FingerPrintDialogComponent extends StatelessWidget {
  const FingerPrintDialogComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // title
          Text(
            'Verifikasi Pesanan',
            style: GoogleTextStyle.fw600.copyWith(
              fontSize: 22.sp,
              color: ColorStyle.softDark,
            ),
          ),

          // subtitle
          Text(
            'Fingerprint',
            style: GoogleTextStyle.fw400.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.grey,
            ),
          ),
          30.verticalSpacingRadius,

          // fingerprint icon
          GestureDetector(
            child: Icon(
              Icons.fingerprint,
              size: 142.r,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () => Get.back<String>(result: 'fingerprint'),
          ),
          30.verticalSpacingRadius,

          SizedBox(
            width: 190.w,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: ColorStyle.dark.withOpacity(0.25),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        'atau',
                        style: GoogleTextStyle.fw400.copyWith(
                          color: ColorStyle.dark.withOpacity(0.25),
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: ColorStyle.dark.withOpacity(0.25),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // verify using pin code
          TextButton(
            onPressed: () => Get.back<String>(result: 'pin'),
            child: Text(
              'Verifikasi Menggunakan PIN',
              style: GoogleTextStyle.fw700.copyWith(
                fontSize: 16.sp,
                color: ColorStyle.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
