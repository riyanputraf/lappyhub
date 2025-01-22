import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/profile/sub_features/rating/repositories/rating_repository.dart';

import '../../../../../shared/styles/color_style.dart';

class RatingController extends GetxController {
  static RatingController get to => Get.find();

  final TextEditingController feedbackController = TextEditingController();
  var rating = 0.obs;

  late final RatingRepository ratingRepository;

  @override
  void onInit() {
    super.onInit();
    ratingRepository = RatingRepository();
  }

  Future<void> submitReview() async {
    if (rating.value == 0 || feedbackController.text.isEmpty) {
      Get.snackbar("Error", "Rating dan feedback tidak boleh kosong",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    try {
      EasyLoading.instance.backgroundColor = ColorStyle.primary;
      EasyLoading.show(
        status: 'Sedang Diproses...',
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
      );
      final response = await ratingRepository.submitReview(
        rating.value,
        feedbackController.text,
      );

      if (response) {
        EasyLoading.instance.backgroundColor = ColorStyle.success;
        EasyLoading.showSuccess('Review berhasil dikirim');
        Get.back();
      }

      feedbackController.clear();
      rating.value = 0;
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
