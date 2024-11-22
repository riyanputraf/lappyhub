import 'package:get/get.dart';

import '../controllers/home_category_laptop_detail_controller.dart';

class CategoryLaptopDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeCategoryLaptopDetailController());
  }
}