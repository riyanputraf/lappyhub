import 'package:get/get.dart';
import 'package:lappyhub/features/order/repositories/order_repository.dart';

class OrderController extends GetxController {
  static OrderController get to => Get.find();

  late final OrderRepository orderRepository;

  var title = 'Ini pesanan'.obs;

  @override
  void onInit() {
    super.onInit();
    orderRepository = OrderRepository();
    title.value = 'Ini pesanan saya';
  }
  @override
  void dispose() {
    print('Order Controller dispose');
    super.dispose();
  }

}
