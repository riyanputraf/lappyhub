import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/home/view/components/laptop_card_component.dart';

import '../../../../../../configs/routes/route.dart';
import '../../../../models/laptop_model.dart';

class CategoryLaptopListComponent extends StatelessWidget {
  const CategoryLaptopListComponent({
    super.key,
    required this.listCategoryLaptop,
  });

  final List<LaptopModel> listCategoryLaptop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        bottom: 50.w,
        top: 20.h,
      ),
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 0),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: listCategoryLaptop.length,
        itemBuilder: (context, index) {
          return LaptopCardComponent(
            laptop: listCategoryLaptop[index],
            onTap: () {
              Get.toNamed(
                  '${Routes.homeRoute}/${listCategoryLaptop[index].id}');
            },
          );
        },
      ),
    );
  }
}
