import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/profile/sub_features/rating/controllers/rating_controller.dart';
import 'package:lappyhub/features/profile/sub_features/rating/view/components/form_rating_component.dart';

import '../../../../../../shared/styles/color_style.dart';
import '../../../../../../shared/widgets/app_bar_custom.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.softGrey,
      appBar: AppBarCustom(
        title: 'Beri Penilaian',
        onBackPressed: () => Get.back(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            GetBuilder<RatingController>(builder: (ratingController) {
              return FormRatingComponent(
                feedbackController: ratingController.feedbackController,
                onRatingChanged: (rating) {
                  ratingController.rating.value = rating.toInt();
                },
                onSubmit: () {
                  ratingController.submitReview();
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
