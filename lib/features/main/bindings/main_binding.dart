import 'package:get/get.dart';
import 'package:lappyhub/features/login/controllers/login_controller.dart';
import 'package:lappyhub/features/order/controllers/order_controller.dart';
import 'package:lappyhub/features/profile/controllers/profile_controller.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    // Lazy load untuk halaman lain
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<OrderController>(() => OrderController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
