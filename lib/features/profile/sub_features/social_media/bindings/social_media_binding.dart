import 'package:get/get.dart';
import 'package:lappyhub/features/profile/sub_features/social_media/controllers/social_medial_controller.dart';

class SocialMediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SocialMedialController());
  }
}