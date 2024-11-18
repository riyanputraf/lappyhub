import 'package:get/get.dart';

import '../controllers/checkout_controller.dart';
import '../sub_features/payment/controllers/checkout_payment_controller.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CheckoutController());
    Get.lazyPut(() => CheckoutPaymentController());
  }
}
