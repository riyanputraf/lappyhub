import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/checkout/controllers/checkout_controller.dart';
import 'package:lappyhub/features/checkout/view/components/choose_date_component.dart';
import 'package:lappyhub/features/checkout/view/components/payment_method_component.dart';

import '../../../../configs/routes/route.dart';
import '../../constants/checkout_assets_constant.dart';

class FormOrderComponent extends StatelessWidget {
  const FormOrderComponent({
    super.key,
    required this.assetsConstant,
  });

  final CheckoutAssetsConstant assetsConstant;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: CheckoutController.to.formKey,
      child: Column(
        children: [
          ChooseDateComponent(
            icon: assetsConstant.calendarIcon,
            hint: 'Pilih tanggal mulai',
            label: 'Tanggal Mulai Sewa',
            controller: CheckoutController.to.startDateController,
            onTap: () {
              CheckoutController.to.pickDate(
                CheckoutController.to.startDateController,
                true,
              );
            },
          ),
          20.verticalSpace,
          ChooseDateComponent(
            icon: assetsConstant.calendarIcon,
            hint: 'Pilih tanggal akhir',
            label: 'Tanggal Akhir Sewa',
            controller: CheckoutController.to.endDateController,
            onTap: () {
              CheckoutController.to.pickDate(
                CheckoutController.to.endDateController,
                false,
              );
            },
          ),
          20.verticalSpace,
          PaymentMethodComponent(
            icon: assetsConstant.paymentIcon,
            hint: 'Pilih Metode Pembayaran',
            label: 'Metode Pembayaran',
            controller: CheckoutController.to.paymentController,
            onTap: () => Get.toNamed(
              Routes.checkoutPaymentRoute,
            ),
          ),
        ],
      ),
    );
  }
}
