import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../shared/styles/color_style.dart';

class UncheckedTrackingComponent extends StatelessWidget {
  const UncheckedTrackingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.r),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [],
      ),
      child: Icon(
        Icons.circle,
        color: ColorStyle.softDark.withOpacity(0.5),
        size: 10.r,
      ),
    );

  }
}
