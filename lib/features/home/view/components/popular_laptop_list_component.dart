import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/home/controllers/home_controller.dart';
import 'package:lappyhub/features/home/view/components/popular_laptop_card_component.dart';

import '../../../../shared/styles/color_style.dart';
import '../../../../shared/styles/google_text_style.dart';
import '../../models/laptop_model.dart';

class LaptopList extends StatelessWidget {
  const LaptopList({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            title,
            style: GoogleTextStyle.fw700.copyWith(
              fontSize: 16.sp,
              color: ColorStyle.dark,
            ),
          ),
        ),
        10.verticalSpace,
        Obx(
          () {
            if (HomeController.to.isLoading.value == 'loading') {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SizedBox(
              height: 250.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                itemCount: HomeController.to.laptops.length,
                itemBuilder: (context, index) {
                  final LaptopModel laptop = HomeController.to.laptops[index];
                  return LaptopCard(
                    laptop: laptop,
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
