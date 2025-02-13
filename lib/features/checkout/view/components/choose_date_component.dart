import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/shared/widgets/input_dialog_custom.dart';

class ChooseDateComponent extends StatelessWidget {
  const ChooseDateComponent({
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
        requiredText: 'Date cannot be empty',
      ),
    );
  }
}
