import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.lazyPut(() => HomeController());
  }
}
