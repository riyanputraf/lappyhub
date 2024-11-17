import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/features/home/models/laptop_model.dart';
import 'package:lappyhub/shared/styles/google_text_style.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../shared/styles/color_style.dart';
import '../../../../shared/widgets/currency_format_custom.dart';

class LaptopCardComponent extends StatelessWidget {
  const LaptopCardComponent({
    super.key,
    required this.laptop,
    this.onTap,
  });

  final LaptopModel laptop;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 98.h,
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
              child: CachedNetworkImage(
                imageUrl: laptop.image,
                height: 70.h,
                width: 90.w,
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
            10.verticalSpace,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  CurrencyFormat.convertToIdr(int.parse(laptop.price), 0),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
