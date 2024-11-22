import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lappyhub/features/home/models/laptop_detail_model.dart';
import 'package:lappyhub/features/home/repositories/detail_laptop_repository.dart';
import 'package:lappyhub/shared/styles/color_style.dart';

import '../view/components/detail_laptop_components/confirm_login_dialog_component.dart';

class DetailLaptopController extends GetxController{
  static DetailLaptopController get to => Get.find();

  late final DetailLaptopRepository detailLaptopRepository;

  final isLoading = 'idle'.obs;
  var detailLaptop = Rxn<LaptopDetailModel>();

  @override
  void onInit() {
    super.onInit();
    detailLaptopRepository = DetailLaptopRepository();

    final laptopId = int.parse(Get.parameters['laptopId'] as String);
    fetchLaptopDetail(laptopId);
  }

  Future<void> fetchLaptopDetail(int id) async {
    try {
      isLoading.value = 'loading';
      final detail = await detailLaptopRepository.fetchLaptopDetail(id);
      detailLaptop.value = detail;
      isLoading.value = 'success';
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch laptop detail');
    }
  }

  Future<void> showConfirmLoginDialog(String image) async {
    await Get.defaultDialog(
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      radius: 30,
      backgroundColor: ColorStyle.softGrey,
      content: ConfirmLoginDialogComponent(image: image),
    );

  }
}