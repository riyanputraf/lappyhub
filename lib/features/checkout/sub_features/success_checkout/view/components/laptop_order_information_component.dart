import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/features/home/models/laptop_detail_model.dart';
import 'package:lappyhub/shared/styles/google_text_style.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../shared/styles/color_style.dart';

class LaptopOrderInformationComponent extends StatelessWidget {
  const LaptopOrderInformationComponent({
    super.key,
    required this.laptop,
    this.width,
    this.height,
  });

  final LaptopDetailModel? laptop;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColorFiltered(
          colorFilter:
              ColorFilter.mode(ColorStyle.softGrey, BlendMode.modulate),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Image.network(
              laptop!.image,
              height: height,
              width: width,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.broken_image, color: Colors.grey);
              },
            ),
          ),
        ),
        Text(
          laptop!.name,
          textAlign: TextAlign.center,
          style: GoogleTextStyle.fw600.copyWith(
            fontSize: 22.sp,
            color: ColorStyle.dark,
          ),
        ),
        Text(
          laptop!.category,
          textAlign: TextAlign.center,
          style: GoogleTextStyle.fw400.copyWith(
            fontSize: 18.sp,
            color: ColorStyle.grey,
          ),
        ),
      ],
    );
  }
}
