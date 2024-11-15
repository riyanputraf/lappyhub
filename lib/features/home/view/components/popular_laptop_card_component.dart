import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/shared/styles/google_text_style.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../shared/styles/color_style.dart';
import '../../../../shared/widgets/currency_format_custom.dart';
import '../../models/laptop_model.dart';

class LaptopCard extends StatelessWidget {
  final LaptopModel laptop;

  const LaptopCard({
    Key? key,
    required this.laptop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.w),
      width: 252.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: CachedNetworkImage(
              imageUrl: laptop.image,
              height: 130.h,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: double.infinity,
                  height: 130.h,
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
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      laptop.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleTextStyle.fw600.copyWith(
                        fontSize: 18.sp,
                        color: ColorStyle.dark,
                      )
                    ),
                    4.verticalSpace,
                    Text(
                      laptop.category,
                      style: GoogleTextStyle.fw400.copyWith(
                        fontSize: 14.sp,
                        color: ColorStyle.grey,
                      )
                    ),
                  ],
                ),
              ),
              RatingBar.builder(
                initialRating: laptop.rating.toDouble(),
                itemPadding: const EdgeInsets.all(0),
                itemSize: 16.r,
                unratedColor: Colors.grey[300],
                allowHalfRating: true,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: ColorStyle.warning,
                ),
                ignoreGestures: true,
                onRatingUpdate: (value) {},
              ),
            ],
          ),
          10.verticalSpace,
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
                )
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
