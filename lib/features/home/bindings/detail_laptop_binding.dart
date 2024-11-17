import 'package:get/get.dart';
import 'package:lappyhub/features/home/controllers/detail_laptop_controller.dart';

class DetailLaptopBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailLaptopController());
  }
}