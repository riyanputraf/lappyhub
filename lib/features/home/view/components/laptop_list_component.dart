import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/home/view/components/laptop_card_component.dart';
import 'package:lappyhub/features/home/view/components/shimmer_laptop_list_component.dart';

import '../../controllers/home_controller.dart';
import '../../models/laptop_model.dart';

class LaptopListComponent extends StatelessWidget {
  const LaptopListComponent({
    Key? key,
    required this.laptop,
  }) : super(key: key);

  final List<LaptopModel> laptop;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (HomeController.to.isLoadingLaptops.value == 'loading') {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: ShimmerLaptopListComponent(height: 98.h),
          );
        }
        return Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 50.w),
          child: Column(
            children: [
              ListView.builder(
                padding: EdgeInsets.only(bottom: 0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: laptop.length,
                itemBuilder: (context, index) {
                  return LaptopCardComponent(laptop: laptop[index]);
                },
              ),

              if (HomeController.to.isLoadingMore.value == 'loading') ...[
                ShimmerLaptopListComponent(height: 98.h)
              ]
            ],
          ),
        );
      },
    );
  }
}
