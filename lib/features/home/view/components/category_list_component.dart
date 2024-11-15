import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/features/home/controllers/home_controller.dart';
import 'package:lappyhub/features/home/view/components/category_card_component.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:lappyhub/shared/styles/google_text_style.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
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
            )
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
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
        ),
      ],
    );
  }
}
