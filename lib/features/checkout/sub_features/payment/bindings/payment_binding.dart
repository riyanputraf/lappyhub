import 'package:get/get.dart';

import '../../../controllers/checkout_controller.dart';
import '../controllers/checkout_payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CheckoutPaymentController());
    Get.lazyPut(() => CheckoutController());
  }
}