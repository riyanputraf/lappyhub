import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../shared/styles/color_style.dart';
import '../../../../../../shared/styles/google_text_style.dart';
import '../../../../../../shared/widgets/currency_format_custom.dart';
import '../../models/detail_order_model.dart';

class OrderDetailCardComponent extends StatelessWidget {
  const OrderDetailCardComponent({
    super.key,
    required this.detailOrder,
  });

  final DetailOrderModel? detailOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.symmetric(
        vertical: 14.h,
        horizontal: 16.w,
      ),
      height: 110.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorStyle.white,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(ColorStyle.white, BlendMode.modulate),
              child: CachedNetworkImage(
                imageUrl: detailOrder!.laptop.image,
                height: 100.h,
                width: 100.w,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 90.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.image_not_supported,
                  color: ColorStyle.dark,
                ),
              ),
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detailOrder!.laptop.name,
                  textAlign: TextAlign.center,
                  style: GoogleTextStyle.fw600.copyWith(
                    fontSize: 16.sp,
                    color: ColorStyle.dark,
                  ),
                ),
                Text(
                  detailOrder!.laptop.category,
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
                CurrencyFormat.convertToIdr(int.parse(detailOrder!.laptop.price), 0),
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
