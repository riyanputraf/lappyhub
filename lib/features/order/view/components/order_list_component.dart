import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/order/controllers/order_controller.dart';
import 'package:lappyhub/features/order/models/order_model.dart';
import 'package:lappyhub/features/order/view/components/order_card_component.dart';

import '../../../../configs/routes/route.dart';
import '../../../../shared/widgets/shimmer_custom.dart';

class OrderListComponent extends StatelessWidget {
  const OrderListComponent({
    super.key,
    required this.orderList,
  });

  final List<OrderModel> orderList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        bottom: 50.w,
        top: 30.h,
      ),
      child: Obx(() {
        return Column(
          children: [
            ListView.builder(
              padding: EdgeInsets.only(bottom: 0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: orderList.length,
              itemBuilder: (context, index) {
                return OrderCardComponent(
                  laptop: orderList[index].laptop,
                  onTap: () {
                    // Get.toNamed('${Routes.orderRoute}/${laptop[index].id}');
                  },
                );
              },
            ),
            if (OrderController.to.isLoadingMore.value == 'loading') ...[
              ShimmerCustom(
                itemCount: 5,
                axis: Axis.vertical,
                padding: EdgeInsets.symmetric(vertical: 0),
                height: 98.h,
                paddingShimmer: EdgeInsets.only(bottom: 16.h),
              ),
            ]
          ],
        );
      }),
    );
  }
}
