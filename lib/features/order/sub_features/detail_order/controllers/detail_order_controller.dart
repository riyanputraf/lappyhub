import 'package:get/get.dart';

import '../../../../../utils/services/hive_service.dart';
import '../models/detail_order_model.dart';
import '../repositories/detail_order_repository.dart';

class DetailOrderController extends GetxController {
  static DetailOrderController get to => Get.find();

  late final DetailOrderRepository detailOrderRepository;

  final isLoading = 'idle'.obs;
  var orderDetail = Rxn<DetailOrderModel>();

  @override
  void onInit() {
    super.onInit();
    final orderId = int.parse(Get.parameters['orderId'] as String);
    detailOrderRepository = DetailOrderRepository();
    fetchOrderDetail(orderId);
  }

  Future<void> fetchOrderDetail(int id) async {
    try {
      String? userId = HiveService.get<String>('id');
      isLoading.value = 'loading';
      final detail = await detailOrderRepository.fetchDetailOrder(userId.toString(), id);
      orderDetail.value = detail;
      isLoading.value = 'success';
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch order detail');
    }
  }
}
