import 'package:get/get.dart';

import '../../../models/laptop_model.dart';
import '../repositories/category_laptop_detail_repository.dart';

class HomeCategoryLaptopDetailController extends GetxController {
  static HomeCategoryLaptopDetailController get to => Get.find();

  var isLoadingCategoryLaptops = 'idle'.obs;

  var categoryLaptop = <LaptopModel>[].obs;
  var categoryName = ''.obs;

  late final CategoryLaptopDetailRepository categoryLaptopDetailRepository;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    final category = arguments['categoryName'];
    categoryName.value = category;
    categoryLaptopDetailRepository = CategoryLaptopDetailRepository();
    fetchLaptopsByCategory(category);
  }

  Future<void> fetchLaptopsByCategory(String categoryName) async {
    try {
      isLoadingCategoryLaptops.value = 'loading';
      final results = await categoryLaptopDetailRepository
          .fetchLaptopsByCategory(categoryName);
      categoryLaptop.value = results;
      isLoadingCategoryLaptops.value = 'success';
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch laptops by category');
    }
  }
}
