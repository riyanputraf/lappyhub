import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/features/order/sub_features/detail_order/view/components/checked_tracking_component.dart';
import 'package:lappyhub/features/order/sub_features/detail_order/view/components/tracking_text_item_component.dart';
import 'package:lappyhub/features/order/sub_features/detail_order/view/components/unchecked_tracking_component.dart';

import '../../../../../../shared/styles/color_style.dart';
import '../../../../../../shared/styles/google_text_style.dart';

class TrackingBodyOrderComponent extends StatelessWidget {
  const TrackingBodyOrderComponent({
    super.key,
    required this.title,
    required this.status,
  });

  final String title;
  final int status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: ColorStyle.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    status == 0
                        ? CheckedTrackingComponent()
                        : UncheckedTrackingComponent(),
                    10.verticalSpace,
                    // Garis Vertikal
                    Container(
                      height: 50.h, // Adjust height as needed
                      width: 2.w,
                      color: Colors.grey.shade300,
                    ),
                    10.verticalSpace,
                    status == 1
                        ? CheckedTrackingComponent()
                        : UncheckedTrackingComponent(),
                    10.verticalSpace,
                    Container(
                      height: 50.h, // Adjust height as needed
                      width: 2.w,
                      color: Colors.grey.shade300,
                    ),
                    10.verticalSpace,
                    status == 2
                        ? CheckedTrackingComponent()
                        : UncheckedTrackingComponent(),
                  ],
                ),
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TrackingTextItemComponent(
                        title: 'Proses',
                        subTitle:
                            'Pesanan anda sedang dalam proses, mohon ditunggu',
                        textColor:
                            status == 0 ? ColorStyle.dark : ColorStyle.grey,
                      ),
                      30.verticalSpace,
                      TrackingTextItemComponent(
                        title: 'Dapat Diambil',
                        subTitle:
                            'Pesanan anda sudah dapat diambil di tempat kami',
                        textColor:
                            status == 1 ? ColorStyle.dark : ColorStyle.grey,
                      ),
                      35.verticalSpace,
                      TrackingTextItemComponent(
                        title: 'Selesai',
                        subTitle: 'Pesanan sudah diambil',
                        textColor:
                            status == 2 ? ColorStyle.dark : ColorStyle.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
