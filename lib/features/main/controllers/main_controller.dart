import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();

  final currentIndex = 0.obs;

  void updateIndex(int index){
    currentIndex.value = index;
  }
}
