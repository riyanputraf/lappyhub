import 'package:get/get.dart';

import '../controllers/checkout_success_checkout_controller.dart';

class SuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CheckoutSuccessCheckoutController());

  }
}