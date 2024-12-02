import 'package:get/get.dart';
import 'package:lappyhub/features/order/repositories/order_repository.dart';

import '../../../utils/services/hive_service.dart';
import '../models/order_model.dart';

class OrderController extends GetxController {
  static OrderController get to => Get.find();

  late final OrderRepository orderRepository;

  var orderList = <OrderModel>[].obs;
  var isLoadingLaptops = 'idle'.obs;
  var isLoadingMore = 'idle'.obs;

  @override
  void onInit() {
    super.onInit();
    orderRepository = OrderRepository();
    // fetchOrders();
  }

  Future<void> fetchOrders() async {
    String? userId = HiveService.get<String>('id');
    isLoadingLaptops.value = 'loading';
    try {
      final data = await orderRepository.fetchOrdersByUserId(userId.toString());
      orderList.value = data;
      isLoadingLaptops.value = 'success';
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch orders: $e');
    }
  }
}
