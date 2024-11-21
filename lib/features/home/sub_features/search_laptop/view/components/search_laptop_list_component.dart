import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/home/models/laptop_model.dart';

import '../../../../../../configs/routes/route.dart';
import '../../../../view/components/laptop_card_component.dart';

class SearchLaptopListComponent extends StatelessWidget {
  const SearchLaptopListComponent({
    super.key,
    required this.laptopList,
  });

  final List<LaptopModel> laptopList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemCount: laptopList.length,
        itemBuilder: (context, index) {
          final laptop = laptopList[index];
          return LaptopCardComponent(
            laptop: laptop,
            onTap: () {
              Get.toNamed('${Routes.homeRoute}/${laptop.id}');
            },
          );
        },
      ),
    );
  }
}
