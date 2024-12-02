import 'package:get/get.dart';
import 'package:lappyhub/features/home/repositories/home_repository.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../constants/home_assets_constant.dart';
import '../models/category_model.dart';
import '../models/laptop_model.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final assetsConstant = HomeAssetsConstant();


  late final HomeRepository homeRepository;

  var categories = <CategoryModel>[].obs;
  var popularLaptops = <LaptopModel>[].obs;
  var listLaptops = <LaptopModel>[].obs;

  var hasMoreData = true.obs;

  var isLoadingCategory = 'idle'.obs;
  var isLoadingPopularLaptops = 'idle'.obs;
  var isLoadingLaptops = 'idle'.obs;
  var isLoadingMore = 'idle'.obs;
  var currentPage = 1;

  // Refresh Controller
  late final RefreshController refreshController;


  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController(
      initialRefresh: false,
    );
    homeRepository = HomeRepository();
    fetchPopularLaptops();
    fetchListLaptops(page: 1);
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      isLoadingCategory.value = 'loading';
      final data = await homeRepository.fetchCategories();
      categories.value = data;
      isLoadingCategory.value = 'success';
    } catch (e) {
      Get.snackbar('Error', 'Failed to load categories');
    }
  }

  /// Fetch data list popular laptop (Horizontal Scroll)
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

  /// Fetch data list laptop (Vertical Scroll)
  Future<void> fetchListLaptops({required int page}) async {
    if (isLoadingLaptops.value == 'loading') return;

    try {
      if (page == 1) {
        isLoadingLaptops.value = 'loading';
      } else {
        isLoadingMore.value = 'loading';
      }

      final laptopsData = await homeRepository.fetchListLaptops(page: page);
      if (page == 1) {
        listLaptops.value = laptopsData;
      } else {
        listLaptops.addAll(laptopsData);
      }

      hasMoreData.value = laptopsData.isNotEmpty;
      currentPage = page;
      isLoadingMore.value = 'success';
      isLoadingLaptops.value = 'success';
    } catch (e) {
      isLoadingLaptops.value = 'error';
      Get.snackbar('Error', 'Failed to fetch laptops');
    }
  }

  /// Refresh data untuk pull-to-refresh
  Future<void> onRefresh() async {
    try {
      currentPage = 1;
      refreshController.resetNoData(); // Reset refresh
      await Future.wait([
        fetchCategories(),
        fetchPopularLaptops(),
        fetchListLaptops(page: 1),
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
      await fetchListLaptops(page: currentPage + 1);
      refreshController.loadComplete(); // Selesaikan load more
    } catch (e) {
      refreshController.loadFailed(); // Gagal load more
    }
  }
}
