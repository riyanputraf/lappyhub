import 'package:get/get.dart';
import 'package:lappyhub/features/profile/sub_features/rating/controllers/rating_controller.dart';

class RatingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RatingController());
  }
}