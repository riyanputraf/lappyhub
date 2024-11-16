import 'package:get/get.dart';
import 'package:lappyhub/features/home/repositories/home_repository.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../constants/home_assets_constant.dart';
import '../models/laptop_model.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final assetsConstant = HomeAssetsConstant();

  List<Map<String, String>> get categories => [
        {'name': 'Asus', 'icon': assetsConstant.asusIcon},
        {'name': 'Apple', 'icon': assetsConstant.appleIcon},
        {'name': 'Acer', 'icon': assetsConstant.acerIcon},
      ];

  late final HomeRepository homeRepository;

  var popularLaptops = <LaptopModel>[].obs;
  var listLaptops = <LaptopModel>[].obs;

  var hasMoreData = true.obs;

  var isLoadingPopularLaptops = 'idle'.obs;
  var isLoadingLaptops = 'idle'.obs;
  // var isLoadingMore = 'idle'.obs;
  var isLoadingMore = false.obs;
  var currentPage = 1;

  // Refresh Controller
  final RefreshController refreshController = RefreshController();

  @override
  void onInit() {
    super.onInit();
    homeRepository = HomeRepository();
    fetchPopularLaptops();
    fetchListLaptops(page: 1);
  }

  Future<void> refreshData() async {
    await fetchPopularLaptops();
    await fetchListLaptops(page: 1);
  }

  Future<void> fetchPopularLaptops() async {
    try {
      isLoadingPopularLaptops.value = 'loading';
      final data = await homeRepository.fetchPopularLaptops();
      popularLaptops.value = data;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch laptops');
    } finally {
      isLoadingPopularLaptops.value = 'success';
    }
  }

  Future<void> fetchListLaptops({required int page}) async {
    if (isLoadingLaptops.value == 'loading') return;

    try {
      if (page == 1) {
        isLoadingLaptops.value = 'loading';
      } else {
        isLoadingMore.value = true;
      }

      final laptopsData = await homeRepository.fetchListLaptops(page: page);
      if (page == 1) {
        listLaptops.value = laptopsData;
      } else {
        listLaptops.addAll(laptopsData);
      }

      hasMoreData.value = laptopsData.isNotEmpty;
      currentPage = page;

      isLoadingLaptops.value = 'success';
    } catch (e) {
      isLoadingLaptops.value = 'error';
      Get.snackbar('Error', 'Failed to fetch laptops');
    } finally {
      isLoadingMore.value = false;
    }
  }

  /// Refresh data untuk pull-to-refresh
  Future<void> onRefresh() async {
    try {
      currentPage = 1;
      refreshController.resetNoData();
      await fetchPopularLaptops();
      await fetchListLaptops(page: 1);
      hasMoreData.value = true; // Reset status data
      isLoadingMore.value = false;
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
      await fetchListLaptops(page: currentPage + 1);
      refreshController.loadComplete(); // Selesaikan load more
    } catch (e) {
      refreshController.loadFailed(); // Gagal load more
    }
  }

}
