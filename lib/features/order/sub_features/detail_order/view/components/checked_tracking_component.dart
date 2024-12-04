import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/shared/styles/color_style.dart';

class CheckedTrackingComponent extends StatelessWidget {
  const CheckedTrackingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: ColorStyle.success,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 8,
            spreadRadius: -1,
            color: Colors.black54,
          ),
        ],
      ),
      child: Icon(
        Icons.check,
        color: Colors.white,
        size: 22.r,
      ),
    );

  }
}
