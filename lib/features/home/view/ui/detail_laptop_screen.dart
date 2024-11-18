import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/home/controllers/detail_laptop_controller.dart';
import 'package:lappyhub/shared/widgets/app_bar_custom.dart';
import 'package:lappyhub/features/home/view/components/detail_laptop_components/chat_button_component.dart';
import 'package:lappyhub/features/home/view/components/detail_laptop_components/header_detail_laptop_component.dart';
import 'package:lappyhub/features/home/view/components/detail_laptop_components/image_laptop_component.dart';
import 'package:lappyhub/features/home/view/components/detail_laptop_components/rent_button_component.dart';
import 'package:lappyhub/features/home/view/components/detail_laptop_components/specification_laptop_component.dart';
import 'package:lappyhub/shared/styles/color_style.dart';

import '../../../../configs/routes/route.dart';
import '../../constants/home_assets_constant.dart';

class DetailLaptopScreen extends StatelessWidget {
  DetailLaptopScreen({super.key});

  final assetsConstant = HomeAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.softGrey,
      appBar: AppBarCustom(
        title: 'Detail Laptop',
        onBackPressed: () => Get.back(),
      ),
      body: Obx(
        () {
          final laptop = DetailLaptopController.to.detailLaptop.value;
          if (DetailLaptopController.to.isLoading.value == 'loading') {
            return Center(
              child: CircularProgressIndicator(
                color: ColorStyle.primary,
              ),
            );
          }
          if (laptop == null) {
            return const Center(
              child: Text("No Data"),
            );
          }

          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.verticalSpace,
                HeaderDetailLaptopComponent(
                  laptop: laptop,
                  icon: assetsConstant.appleIcon,
                  category: laptop.category,
                  rating: laptop.rating,
                ),
                ImageLaptopComponent(
                  laptop: laptop,
                  height: 250.h,
                  width: double.infinity,
                ),
                SpecificationLaptopComponent(
                  spec: laptop.specs,
                ),
                20.verticalSpace,
                RentButtonComponent(
                  laptop: laptop,
                  onTap: () {
                    Get.toNamed(
                      Routes.checkoutRoute,
                      arguments: {
                        'laptop': laptop,
                        'laptopPrice': laptop.price,
                      },
                    );
                  },
                ),
                10.verticalSpace,
                ChatButtonComponent(
                  icon: assetsConstant.messageIcon,
                ),
                20.verticalSpace,
              ],
            ),
          );
        },
      ),
    );
  }
}
