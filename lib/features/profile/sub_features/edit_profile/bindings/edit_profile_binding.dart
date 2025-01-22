import 'package:get/get.dart';
import 'package:lappyhub/features/profile/sub_features/edit_profile/controllers/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EditProfileController());
  }
}