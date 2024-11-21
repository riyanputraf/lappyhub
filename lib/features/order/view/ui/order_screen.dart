import 'package:flutter/material.dart';
import 'package:lappyhub/features/order/controllers/order_controller.dart';
import 'package:lappyhub/shared/styles/color_style.dart';
import 'package:lappyhub/shared/widgets/app_bar_custom.dart';

import '../../constants/order_assets_constant.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);

  final assetsConstant = OrderAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.softGrey,
      appBar: AppBarCustom(
        title: OrderController.to.title.value,
      ),
    );
  }
}
