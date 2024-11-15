import 'package:flutter/material.dart';
import 'package:lappyhub/shared/styles/color_style.dart';

import '../../constants/order_assets_constant.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);

  final assetsConstant = OrderAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Orders'));
  }
}
