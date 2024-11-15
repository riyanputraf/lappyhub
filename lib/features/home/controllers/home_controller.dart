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
  var laptops = <LaptopModel>[].obs;
  var isLoading = 'loading'.obs;

  @override
  void onInit() {
    super.onInit();
    homeRepository = HomeRepository();
    fetchLaptops();
  }

  Future<void> fetchLaptops() async {
    try {
      isLoading.value = 'loading';
      final data = await homeRepository.fetchLaptops();
      laptops.value = data;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch laptops');
    } finally {
      isLoading.value = 'success';
    }
  }
}
