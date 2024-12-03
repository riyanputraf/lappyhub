import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/order/view/components/empty_order_illustration_component.dart';
import 'package:lappyhub/features/order/view/components/illustration_not_login_component.dart';
import 'package:lappyhub/features/order/view/components/order_app_bar_component.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../configs/routes/route.dart';
import '../../../../shared/widgets/shimmer_custom.dart';
import '../../constants/order_assets_constant.dart';
import '../../controllers/order_controller.dart';
import '../components/order_list_component.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);

  final assetsConstant = OrderAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.softGrey,
      appBar: OrderAppBarComponent(
        title: 'Pesanan',
      ),
      body: SmartRefresher(
        physics: const BouncingScrollPhysics(),
        controller: OrderController.to.refreshController,
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: OrderController.to.onRefresh,
        onLoading: OrderController.to.onLoading,
        child: SingleChildScrollView(
          child: Obx(
            () {
              if (OrderController.to.isLogin.value == false) {
                return IllustrationNotLoginComponent(
                  image: assetsConstant.notLoginImage,
                  onTap: () {
                    Get.toNamed(Routes.loginRoute);
                  },
                );
              }
              if (OrderController.to.isLoadingLaptops.value == 'loading') {
                return Column(
                  children: [
                    30.verticalSpace,
                    ShimmerCustom(
                      itemCount: 10,
                      axis: Axis.vertical,
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0),
                      height: 130.h,
                      paddingShimmer: EdgeInsets.only(bottom: 16.h),
                    ),
                  ],
                );
              }
              if (OrderController.to.orderList.isEmpty) {
                return EmptyOrderIllustrationComponent(
                  image: assetsConstant.emptyOrderImage,
                );
              }

              return Column(
                children: [
                  OrderListComponent(
                    orderList: OrderController.to.orderList,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
