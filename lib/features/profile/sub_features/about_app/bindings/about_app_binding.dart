import 'package:get/get.dart';
import 'package:lappyhub/features/profile/sub_features/about_app/controllers/about_app_controller.dart';

class AboutAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AboutAppController());
  }
}