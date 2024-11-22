import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/home/sub_features/category_laptop_detail/view/components/category_laptop_list_component.dart';
import 'package:lappyhub/features/home/sub_features/category_laptop_detail/view/components/category_not_found_component.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:lappyhub/shared/widgets/app_bar_custom.dart';

import '../../../../constants/home_assets_constant.dart';
import '../../controllers/home_category_laptop_detail_controller.dart';

class CategoryLaptopDetailScreen extends StatelessWidget {
  CategoryLaptopDetailScreen({Key? key}) : super(key: key);

  final assetsConstant = HomeAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.softGrey,
      appBar: AppBarCustom(
        title:
            'Category ${HomeCategoryLaptopDetailController.to.categoryName.value}',
        onBackPressed: () => Get.back(),
      ),
      body: Obx(
        () {
          if (HomeCategoryLaptopDetailController
                  .to.isLoadingCategoryLaptops.value ==
              'loading') {
            return Center(
              child: CircularProgressIndicator(
                color: ColorStyle.primary,
              ),
            );
          }
          if (HomeCategoryLaptopDetailController.to.categoryLaptop.isEmpty) {
            return CategoryNotFoundComponent(
              image: assetsConstant.searchNotFoundImage,
            );
          }
          return CategoryLaptopListComponent(
            listCategoryLaptop:
                HomeCategoryLaptopDetailController.to.categoryLaptop,
          );
        },
      ),
    );
  }
}
