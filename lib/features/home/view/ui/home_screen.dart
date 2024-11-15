import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/features/home/controllers/home_controller.dart';
import 'package:lappyhub/features/home/view/components/app_bar_component.dart';
import 'package:lappyhub/features/home/view/components/category_list_component.dart';
import 'package:lappyhub/features/home/view/components/laptop_list_component.dart';
import 'package:lappyhub/features/home/view/components/popular_laptop_list_component.dart';
import 'package:lappyhub/features/home/view/components/section_header_component.dart';
import 'package:lappyhub/shared/styles/color_style.dart';

import '../../constants/home_assets_constant.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final assetsConstant = HomeAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.softGrey,
      appBar: AppBarComponent(
        logoPath: assetsConstant.lappyHeader,
        icon: assetsConstant.searchIcon,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            36.verticalSpace,

            ///List Categori
            SectionHeaderComponent(
              title: 'Kategori',
            ),
            CategoryList(),

            30.verticalSpace,

            ///List Laptop Populer
            SectionHeaderComponent(
              title: 'Populer',
            ),
            PopularLaptopList(
              laptop: HomeController.to.popularLaptops,
            ),

            30.verticalSpace,

            ///List Laptop
            SectionHeaderComponent(
              title: 'List Laptop',
            ),
            LaptopListComponent(
              laptop: HomeController.to.listLaptops,
            ),
          ],
        ),
      ),
    );
  }
}
