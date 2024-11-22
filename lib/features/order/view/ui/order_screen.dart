import 'package:flutter/material.dart';
import 'package:lappyhub/features/order/view/components/order_app_bar_component.dart';
import 'package:lappyhub/shared/styles/color_style.dart';

import '../../constants/order_assets_constant.dart';

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
    );
  }
}
