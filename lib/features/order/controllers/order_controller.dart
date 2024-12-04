import 'package:get/get.dart';
import 'package:lappyhub/features/order/repositories/order_repository.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../utils/services/hive_service.dart';
import '../models/order_model.dart';

class OrderController extends GetxController {
  static OrderController get to => Get.find();

  late final OrderRepository orderRepository;

  var orderList = <OrderModel>[].obs;
  var isLoadingLaptops = 'idle'.obs;

  var isLogin = false.obs;

  var hasMoreData = true.obs;
  var isLoadingMore = 'idle'.obs;
  var currentPage = 1;

  var selectedStatus = Rxn<int?>();
  // Status Options untuk Dropdown
  final List<Map<String, dynamic>> statusOptions = [
    {'label': 'Semua Status', 'value': null},
    {'label': 'Sedang Diproses', 'value': 0},
    {'label': 'Dapat Diambil', 'value': 1},
    {'label': 'Selesai', 'value': 2},
    {'label': 'Dibatalkan', 'value': 3},
    {'label': 'Not Found Status Test', 'value': 4},
  ];

  // Refresh Controller
  late final RefreshController refreshController;

  @override
  void onInit() {
    super.onInit();
    orderRepository = OrderRepository();
    refreshController = RefreshController(
      initialRefresh: false,
    );

    // Kondisi jika sudah login
    if (HiveService.isUserLoggedIn()) {
      fetchOrders(page: 1);
      isLogin.value = true;
    }

    ever(HiveService.isLoggedInStatus, (isLoggedIn) {
      if (isLoggedIn) {
        fetchOrders(page: 1);
        isLogin.value = true;
      } else {
        orderList.clear();
        isLogin.value = false;
      }
    });


  }

  Future<void> fetchOrders({required int page, int? status}) async {
    if (isLoadingLaptops.value == 'loading') return;

    try {
      String? userId = HiveService.get<String>('id');
      if (page == 1) {
        isLoadingLaptops.value = 'loading';
      } else {
        isLoadingMore.value = 'loading';
      }
      final data = await orderRepository.fetchOrdersByUserId(userId.toString(), page: page, status: status);

      if (page == 1) {
        orderList.value = data;
      } else {
        orderList.addAll(data);
      }

      hasMoreData.value = data.isNotEmpty;
      currentPage = page;
      isLoadingMore.value = 'success';
      isLoadingLaptops.value = 'success';
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch orders: $e');
    }
  }

  Future<void> onRefresh() async {
    try {
      currentPage = 1;
      refreshController.resetNoData(); // Reset refresh
      await Future.wait([
        fetchOrders(page: 1, status: selectedStatus.value),
      ]);
      hasMoreData.value = true; // Reset status data
      isLoadingMore.value = 'idle';
      refreshController.refreshCompleted(); // Selesaikan refresh
    } catch (e) {
      refreshController.refreshFailed(); // Gagal refresh
    }
  }

  /// Load more data
  Future<void> onLoading() async {
    if (!hasMoreData.value) {
      refreshController.loadNoData(); // Tidak ada data lagi
      return;
    }

    try {
      await fetchOrders(page: currentPage + 1, status: selectedStatus.value);
      refreshController.loadComplete(); // Selesaikan load more
    } catch (e) {
      refreshController.loadFailed(); // Gagal load more
    }
  }

  // Ubah status dan fetch data
  void updateStatus(int? status) {
    selectedStatus.value = status;
    fetchOrders(page: 1, status: status);
  }
}
