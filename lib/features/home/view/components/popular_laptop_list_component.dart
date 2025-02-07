import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/home/controllers/home_controller.dart';
import 'package:lappyhub/features/home/view/components/popular_laptop_card_component.dart';
import 'package:lappyhub/shared/widgets/shimmer_custom.dart';

import '../../../../configs/routes/route.dart';
import '../../models/laptop_model.dart';

class PopularLaptopList extends StatelessWidget {
  const PopularLaptopList({
    super.key,
    required this.laptop,
  });

  final List<LaptopModel> laptop;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (HomeController.to.isLoadingPopularLaptops.value == 'loading') {
          return SizedBox(
            height: 250.h,
            child: ShimmerCustom(
              itemCount: 5,
              axis: Axis.horizontal,
              width: 252.w,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
            ),
          );
        }
        return SizedBox(
          height: 250.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            itemCount: laptop.length,
            itemBuilder: (context, index) {
              return PopularLaptopCardComponent(
                laptop: laptop[index],
                onTap: () {
                  Get.toNamed('${Routes.homeRoute}/${laptop[index].id}');
                },
              );
            },
          ),
        );
      },
    );
  }
}
