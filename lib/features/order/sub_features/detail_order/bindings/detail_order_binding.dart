import 'package:get/get.dart';
import 'package:lappyhub/features/order/sub_features/detail_order/controllers/detail_order_controller.dart';

class DetailOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailOrderController());
  }
}