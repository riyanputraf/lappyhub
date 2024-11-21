import 'package:get/get.dart';
import 'package:lappyhub/features/login/controllers/login_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    Get.lazyPut(() => LoginController());
  }
}
