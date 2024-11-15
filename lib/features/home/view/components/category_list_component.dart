import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/features/home/controllers/home_controller.dart';
import 'package:lappyhub/features/home/view/components/category_card_component.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 24.w),
        itemCount: HomeController.to.categories.length,
        itemBuilder: (context, index) {
          final category = HomeController.to.categories[index];
          return CategoryCardComponent(
            name: category['name']!,
            iconPath: category['icon']!,
          );
        },
      ),
    );
  }
}
