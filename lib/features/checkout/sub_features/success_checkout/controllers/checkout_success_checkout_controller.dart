import 'package:get/get.dart';

import '../../../../home/models/laptop_detail_model.dart';

class CheckoutSuccessCheckoutController extends GetxController {
  static CheckoutSuccessCheckoutController get to => Get.find();

  var detailLaptop = Rxn<LaptopDetailModel>();

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    final LaptopDetailModel laptop = arguments['laptop'];
    detailLaptop.value = laptop;
  }
}
