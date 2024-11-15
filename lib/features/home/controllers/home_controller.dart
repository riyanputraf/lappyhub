import 'package:get/get.dart';
import 'package:lappyhub/features/home/repositories/home_repository.dart';

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

  var isLoadingPopularLaptops = 'loading'.obs;
  var isLoadingLaptops = 'loading'.obs;

  @override
  void onInit() {
    super.onInit();
    homeRepository = HomeRepository();
    fetchPopularLaptops();
    fetchListLaptops();
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

  Future<void> fetchListLaptops() async {
    try {
      isLoadingLaptops.value = 'loading';
      final data = await homeRepository.fetchListLaptops();
      listLaptops.value = data;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch laptops');
    } finally {
      isLoadingLaptops.value = 'success';
    }
  }
}
