import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../../shared/styles/google_text_style.dart';
import '../../controllers/order_controller.dart';

class DropdownStatusOrderComponent extends StatelessWidget {
  const DropdownStatusOrderComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 15.h,
        left: 24.w,
        right: 24.w,
      ),
      child: Obx(
        () => DropdownButtonFormField2<int?>(
          isExpanded: true,
          value: OrderController.to.selectedStatus.value,
          items: OrderController.to.statusOptions.map((status) {
            return DropdownMenuItem<int?>(
              value: status['value'],
              child: InkWell(
                child: Text(
                  status['label'],
                  style: GoogleTextStyle.fw500.copyWith(
                    color: ColorStyle.dark,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            OrderController.to.updateStatus(value);
          },
          dropdownStyleData: DropdownStyleData(
            offset: Offset(0.h, -8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: ColorStyle.white,
            ),
          ),
          decoration: InputDecoration(
            fillColor: ColorStyle.white,
            filled: true,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
