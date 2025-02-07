import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/home/controllers/home_controller.dart';
import 'package:lappyhub/features/home/view/components/app_bar_component.dart';
import 'package:lappyhub/features/home/view/components/category_list_component.dart';
import 'package:lappyhub/features/home/view/components/laptop_list_component.dart';
import 'package:lappyhub/features/home/view/components/popular_laptop_list_component.dart';
import 'package:lappyhub/shared/widgets/section_header_custom.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../configs/routes/route.dart';
import '../../constants/home_assets_constant.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final assetsConstant = HomeAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorStyle.softGrey,
      appBar: AppBarComponent(
        logoPath: assetsConstant.lappyHeader,
        icon: assetsConstant.searchIcon,
        onTap: () {
          Get.toNamed(Routes.homeSearchLaptopRoute);
        },
      ),
      body: SmartRefresher(
        physics: const BouncingScrollPhysics(),
        controller: HomeController.to.refreshController,
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: HomeController.to.onRefresh,
        onLoading: HomeController.to.onLoading,
        child: SingleChildScrollView(
          child: Column(
            children: [
              36.verticalSpace,

              /// List Kategori
              SectionHeaderCustom(title: 'Merek'),
              CategoryList(
                listCategory: HomeController.to.categories,
              ),

              30.verticalSpace,

              /// List Laptop Populer (Horizontal Scroll)
              SectionHeaderCustom(title: 'Populer'),
              PopularLaptopList(
                laptop: HomeController.to.popularLaptops,
              ),

              30.verticalSpace,

              /// List Laptop (Vertical Scroll)
              SectionHeaderCustom(title: 'Laptop Lainnya'),
              LaptopListComponent(
                laptop: HomeController.to.listLaptops,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
