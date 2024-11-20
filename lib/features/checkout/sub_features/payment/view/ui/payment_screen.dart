import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/checkout/controllers/checkout_controller.dart';
import 'package:lappyhub/features/checkout/sub_features/payment/controllers/checkout_payment_controller.dart';
import 'package:lappyhub/features/checkout/sub_features/payment/view/components/payment_list_component.dart';
import 'package:lappyhub/shared/widgets/app_bar_custom.dart';

import '../../../../../../shared/styles/color_style.dart';
import '../../../../../../shared/widgets/button_primary_custom.dart';
import '../../../../constants/checkout_assets_constant.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);

  final assetsConstant = CheckoutAssetsConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.softGrey,
      appBar: AppBarCustom(
        title: 'Metode Pembayaran',
        onBackPressed: () => Get.back(),
      ),
      body: Column(
        children: [
          10.verticalSpace,
          Expanded(
            child: Obx(
              () {
                if (CheckoutPaymentController.to.isLoading.value == 'loading') {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorStyle.primary,
                    ),
                  );
                }
                return PaymentListComponent(
                  paymentList: CheckoutPaymentController.to.paymentMethods,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 30.h,
        ),
        child: ButtonPrimaryCustom(
          text: 'Pilih Pembayaran',
          onTap: () {
            if (CheckoutPaymentController.to.selectedPaymentId.value != '') {
              CheckoutController.to.updateSelectedPayment(
                  CheckoutPaymentController.to.getSelectedPayment()!.name);
              Get.back();
            }
          },
        ),
      ),
    );
  }
}
