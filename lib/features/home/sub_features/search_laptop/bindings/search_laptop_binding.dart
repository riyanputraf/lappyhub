import 'package:get/get.dart';

import '../controllers/home_search_laptop_controller.dart';

class SearchLaptopBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeSearchLaptopController());
  }
}
