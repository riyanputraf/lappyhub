import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lappyhub/configs/routes/route.dart';
import 'package:lappyhub/features/search_location/view/ui/search_location_screen.dart';

import '../../features/splash/controllers/splash_controller.dart';
import '../../utils/services/location_service.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find();

  var isConnect = false.obs;

  @override
  void onReady() {
    super.onReady();

    getLocation();
    LocationServices.streamService.listen((status) => getLocation());
  }



  /// Location
  RxString statusLocation = RxString('loading');
  RxString messageLocation = RxString('');
  Rxn<Position> position = Rxn<Position>();
  RxnString address = RxnString();

  Future<void> getLocation() async {
    if (Get.isDialogOpen == false) {
      Get.dialog(SearchLocationScreen(), barrierDismissible: false);
    }

    try {
      /// Mendapatkan Lokasi saat ini
      statusLocation.value = 'loading';
      final locationResult = await LocationServices.getCurrentPosition();

      if (locationResult.success) {
        /// Jika jarak lokasi cukup dekat, dapatkan informasi alamat
        position.value = locationResult.position;
        address.value = locationResult.address;
        statusLocation.value = 'success';

        await Future.delayed(const Duration(seconds: 1));
        ///navigasi ke halaman splash
        Get.until(ModalRoute.withName(Routes.splashRoute));
        SplashController.to.navigateToLogin();
      } else {
        /// Jika jarak lokasi tidak cukup dekat, tampilkan pesan
        statusLocation.value = 'error';
        messageLocation.value = locationResult.message!;
      }
    } catch (e) {
      /// Jika terjadi kesalahan server
      statusLocation.value = 'error';
      messageLocation.value = 'Server error'.tr;
    }
  }

  /// Check Internet Connection
  Future<bool> checkConnection() async {
    if (!kIsWeb) {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
          isConnect.value = true;
          debugPrint("Connect!");
          return true;
        }
        log("Failed to connect to internet for some reason");
        return false;
      } on SocketException catch (_) {
        isConnect.value = false;
        log("No Internet Connection");
        return false;
      }
    } else {
      return true;
    }
  }
}
