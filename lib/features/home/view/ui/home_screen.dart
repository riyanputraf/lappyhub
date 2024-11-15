import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lappyhub/features/home/view/components/app_bar_component.dart';
import 'package:lappyhub/features/home/view/components/category_list_component.dart';
import 'package:lappyhub/features/home/view/components/popular_laptop_list_component.dart';
import 'package:lappyhub/shared/styles/color_style.dart';

import '../../constants/home_assets_constant.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final assetsConstant = HomeAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorStyle.softGrey,
        appBar: AppBarComponent(
          logoPath: assetsConstant.lappyHeader,
          icon: assetsConstant.searchIcon,
        ),
        body: ListView(
          children: [
            36.verticalSpace,
            CategoryList(
              title: 'Kategori',
            ),
            30.verticalSpace,
            LaptopList(
              title: 'Populer',
            ),
          ],
        ),
      ),
    );
  }
}
