import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/order/sub_features/detail_order/controllers/detail_order_controller.dart';
import 'package:lappyhub/features/order/sub_features/detail_order/view/components/order_detail_card_component.dart';
import 'package:lappyhub/features/order/sub_features/detail_order/view/components/summary_detail_order_component.dart';
import 'package:lappyhub/features/order/sub_features/detail_order/view/components/tracking_body_order_component.dart';
import 'package:lappyhub/shared/styles/color_style.dart';

import '../../../../../../shared/widgets/app_bar_custom.dart';
import '../../../../constants/order_assets_constant.dart';

class DetailOrderScreen extends StatelessWidget {
  DetailOrderScreen({Key? key}) : super(key: key);

  final assetsConstant = OrderAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.softGrey,
      appBar: AppBarCustom(
        title: 'Detail Pesanan',
        onBackPressed: () => Get.back(),
      ),
      body: Obx(
        () {
          if (DetailOrderController.to.isLoading.value == 'loading') {
            return Center(
              child: CircularProgressIndicator(
                color: ColorStyle.primary,
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                20.verticalSpace,
                OrderDetailCardComponent(
                  detailOrder: DetailOrderController.to.orderDetail.value,
                ),
                20.verticalSpace,
                SummaryDetailOrderComponent(
                  title: 'Rincian Pemesanan',
                  detailOrder: DetailOrderController.to.orderDetail.value,
                ),
                20.verticalSpace,
                TrackingBodyOrderComponent(
                  title: 'Status Pesanan Anda',
                  status: DetailOrderController.to.orderDetail.value!.status,
                ),
                30.verticalSpace,
              ],
            ),
          );
        },
      ),
    );
  }
}
