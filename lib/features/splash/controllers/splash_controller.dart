import 'package:get/get.dart';

import '../../../configs/routes/route.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();


  void navigateToLogin() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
          Get.offAllNamed(Routes.loginRoute);
      },
    );
  }
}
