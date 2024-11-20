import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/shared/styles/color_style.dart';

import '../../../../shared/widgets/input_dialog_custom.dart';

class PaymentMethodComponent extends StatelessWidget {
  const PaymentMethodComponent({
    super.key,
    required this.icon,
    required this.hint,
    required this.label,
    required this.controller,
    this.onTap,
  });

  final String icon;
  final String hint;
  final String label;
  final TextEditingController controller;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
      child: InputDialogCustom(
        icon: icon,
        hint: hint,
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        label: label,
        enable: false,
        onTapBox: onTap,
        isRequired: true,
        requiredText: 'Payment cannot be empty',
        suffixIcon: Icon(
          Icons.chevron_right,
          color: ColorStyle.dark,
          size: 24.r,
        ),
      ),
    );
  }
}
