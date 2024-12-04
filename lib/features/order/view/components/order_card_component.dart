import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/features/order/view/components/status_order_component.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../shared/styles/color_style.dart';
import '../../../../shared/styles/google_text_style.dart';
import '../../../../shared/widgets/currency_format_custom.dart';
import '../../models/order_laptop_model.dart';
import '../../models/order_model.dart';

class OrderCardComponent extends StatelessWidget {
  const OrderCardComponent({
    super.key,
    required this.laptop,
    this.onTap,
    required this.order,
  });

  final OrderLaptopModel laptop;
  final OrderModel order;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 130.h,
        margin: EdgeInsets.only(bottom: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: ColorStyle.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(ColorStyle.white, BlendMode.modulate),
                child: CachedNetworkImage(
                  imageUrl: laptop.image,
                  height: 95.h,
                  width: 107.w,
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
                  StatusOrderComponent(status: order.status),
                  4.verticalSpace,
                  Text(
                    laptop.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleTextStyle.fw600.copyWith(
                      fontSize: 16.sp,
                      color: ColorStyle.dark,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    laptop.category,
                    style: GoogleTextStyle.fw400.copyWith(
                      fontSize: 14.sp,
                      color: ColorStyle.grey,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    CurrencyFormat.convertToIdr(order.grandPrice, 0),
                    style: GoogleTextStyle.fw700.copyWith(
                      fontSize: 16.sp,
                      color: ColorStyle.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
