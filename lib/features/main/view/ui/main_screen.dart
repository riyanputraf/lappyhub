import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/home/view/ui/home_screen.dart';
import 'package:lappyhub/features/main/controllers/main_controller.dart';
import 'package:lappyhub/features/main/view/components/navigation_item_component.dart';
import 'package:lappyhub/features/order/view/ui/order_screen.dart';
import 'package:lappyhub/features/profile/view/ui/profile_screen.dart';
import 'package:lappyhub/shared/styles/color_style.dart';

import '../../constants/main_assets_constant.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final assetsConstant = MainAssetsConstant();

  // List pages yang dihubungkan dalam IndexedStack
  final navigatePages = [
    HomeScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(
        () => IndexedStack(
          index: MainController.to.currentIndex.value,
          children: navigatePages,
        ),
      ),
      bottomNavigationBar: Obx(() {
        return Container(
          height: 78.h,
          margin: EdgeInsets.all(24.r),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            color: ColorStyle.softDark,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Row(
            children: [
              NavigationItemComponent(
                label: 'Home',
                icon: assetsConstant.homeIcon,
                iconOn: assetsConstant.homeIconOn,
                isActive: MainController.to.currentIndex.value == 0,
                onTap: () {
                  MainController.to.updateIndex(0);
                },
              ),
              NavigationItemComponent(
                label: 'Pesanan',
                icon: assetsConstant.orderIcon,
                iconOn: assetsConstant.orderIconOn,
                isActive: MainController.to.currentIndex.value == 1,
                onTap: () {
                  MainController.to.updateIndex(1);
                },
              ),
              NavigationItemComponent(
                label: 'Obrolan',
                icon: assetsConstant.chatIcon,
                iconOn: assetsConstant.chatIcon,
                hasDot: true,
                onTap: () {},
              ),
              NavigationItemComponent(
                label: 'Profile',
                icon: assetsConstant.profileIcon,
                iconOn: assetsConstant.profileIconOn,
                isActive: MainController.to.currentIndex.value == 2,
                onTap: () {
                  MainController.to.updateIndex(2);
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
