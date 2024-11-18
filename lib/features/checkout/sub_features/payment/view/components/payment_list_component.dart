import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/checkout/sub_features/payment/models/payment_model.dart';
import 'package:lappyhub/features/checkout/sub_features/payment/view/components/payment_card_component.dart';

import '../../controllers/checkout_payment_controller.dart';

class PaymentListComponent extends StatelessWidget {
  const PaymentListComponent({
    super.key,
    required this.paymentList,
  });

  final List<PaymentModel> paymentList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: paymentList.length,
      itemBuilder: (context, index) {
        final payment = paymentList[index];
        return Obx(
          () {
            return PaymentCardComponent(
              isSelected:
                  CheckoutPaymentController.to.selectedPaymentId.value ==
                      payment.id,
              payment: payment,
              onTap: () {
                CheckoutPaymentController.to.selectedPaymentId(payment.id);
              },
            );
          },
        );
      },
    );
  }
}
