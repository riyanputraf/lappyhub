import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/home/controllers/home_controller.dart';
import 'package:lappyhub/features/home/models/category_model.dart';
import 'package:lappyhub/features/home/view/components/category_card_component.dart';
import 'package:lappyhub/shared/widgets/shimmer_custom.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.listCategory,
  });

  final List<CategoryModel> listCategory;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (HomeController.to.isLoadingCategory.value == 'loading') {
        return SizedBox(
          height: 70.h,
          child: ShimmerCustom(
            itemCount: 5,
            axis: Axis.horizontal,
            padding: EdgeInsets.only(left: 24.w),
            height: 70.h,
            width: 139.w,
          ),
        );
      }
      return SizedBox(
        height: 70.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 24.w),
          itemCount: listCategory.length,
          itemBuilder: (context, index) {
            final category = HomeController.to.categories[index];
            return CategoryCardComponent(
              name: category.name,
              iconPath: category.icon,
            );
          },
        ),
      );
    });
  }
}
