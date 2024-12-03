import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/shared/styles/color_style.dart';

import '../../../../shared/styles/google_text_style.dart';

class StatusOrderComponent extends StatelessWidget {
  const StatusOrderComponent({
    super.key,
    required this.status,
  });

  final int status;

  @override
  Widget build(BuildContext context) {

    String statusText;
    IconData iconData;
    Color iconColor;

    switch (status) {
      case 0:
        statusText = "Sedang Diproses";
        iconData = Icons.timer;
        iconColor = ColorStyle.warning;
        break;
      case 1:
        statusText = "Dapat Diambil";
        iconData = Icons.how_to_reg;
        iconColor = ColorStyle.secondary;
        break;
      case 2:
        statusText = "Sukses";
        iconData = Icons.check_circle;
        iconColor = ColorStyle.success;
        break;
      case 3:
      default:
        statusText = "Dibatalkan";
        iconData = Icons.cancel;
        iconColor = Colors.red;
        break;
    }

    return  Row(
      children: [
        Icon(
          iconData,
          color: iconColor,
          size: 16.r,
        ),
        4.horizontalSpace,
        Text(
          statusText,
          style: GoogleTextStyle.fw500.copyWith(
            fontSize: 14.sp,
            color: iconColor,
          ),
        ),
      ],
    );
  }
}
