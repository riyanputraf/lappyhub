import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../shared/styles/color_style.dart';
import '../../../models/laptop_detail_model.dart';

class ImageLaptopComponent extends StatelessWidget {
  const ImageLaptopComponent({
    super.key,
    required this.laptop,
    this.height,
    this.width,
  });

  final LaptopDetailModel laptop;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(ColorStyle.softGrey, BlendMode.modulate),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Image.network(
          laptop.image,
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
    );
  }
}
