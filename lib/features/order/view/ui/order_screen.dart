import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/order/view/components/illustration_not_login_component.dart';
import 'package:lappyhub/features/order/view/components/order_app_bar_component.dart';
import 'package:lappyhub/shared/styles/color_style.dart';

import '../../../../configs/routes/route.dart';
import '../../../login/controllers/login_controller.dart';
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
      body: SingleChildScrollView(
        child: Obx(
          () {
            if (LoginController.to.isLoggedIn.value == false) {
              return IllustrationNotLoginComponent(
                image: assetsConstant.notLoginImage,
                onTap: () {
                  Get.toNamed(Routes.loginRoute);
                },
              );
            }
            OrderController.to.fetchOrders();
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
    );
  }
}
