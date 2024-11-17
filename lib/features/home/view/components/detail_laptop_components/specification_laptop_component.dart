import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/features/home/models/laptop_spec_model.dart';
import 'package:lappyhub/features/home/view/components/detail_laptop_components/specification_item_component.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:lappyhub/shared/styles/google_text_style.dart';

class SpecificationLaptopComponent extends StatelessWidget {
  const SpecificationLaptopComponent({
    super.key,
    required this.spec,
  });

  final LaptopSpecModel spec;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Spesifikasi',
            style: GoogleTextStyle.fw600.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.dark,
            ),
          ),
          10.verticalSpace,
          SpecificationItem(
            title: 'CPU',
            description: spec.cpu,
          ),
          SpecificationItem(
            title: 'GPU',
            description: spec.gpu,
          ),
          SpecificationItem(
            title: 'Memori Integrasi (RAM)',
            description: spec.ram,
          ),
          SpecificationItem(
            title: 'Memori Internal (ROM)',
            description: spec.rom,
          ),
          SpecificationItem(
            title: 'Baterai',
            description: spec.baterai,
          ),
          SpecificationItem(
            title: 'Kamera Facetime',
            description: spec.kamera,
          ),
          SpecificationItem(
            title: 'Fingerprint',
            description: spec.fingerprint,
          ),
        ],
      ),
    );
  }
}
