import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lappyhub/features/checkout/view/components/finger_print_dialog_component.dart';
import 'package:lappyhub/features/checkout/view/components/pin_dialog_component.dart';
import 'package:local_auth/local_auth.dart';

import '../../../configs/routes/route.dart';
import '../../home/models/laptop_detail_model.dart';

class CheckoutController extends GetxController {
  static CheckoutController get to => Get.find();

  var formKey = GlobalKey<FormState>();

  var startDateController = TextEditingController();
  var endDateController = TextEditingController();

  var paymentController = TextEditingController();
  final RxString selectedPaymentMethod = ''.obs;

  final Rxn<DateTime> startDate = Rxn<DateTime>();
  final Rxn<DateTime> endDate = Rxn<DateTime>();
  final RxInt durationDays = 0.obs;

  final RxList<String> rentNeedOptions = [
    'Keperluan pribadi',
    'Penelitian',
    'Pembelajaran',
    'Acara khusus',
  ].obs;

  final RxString selectedRentNeed = 'Keperluan pribadi'.obs;

  final RxInt laptopPrice = 0.obs;

  // Biaya jasa aplikasi
  final int serviceFee = 2000;

  final RxInt subTotalPrice = 0.obs;
  final RxInt grandTotalPrice = 0.obs;

  var detailLaptop = Rxn<LaptopDetailModel>();

  var isVerified = false.obs;

  @override
  void onInit() {
    super.onInit();
    laptopPrice.value = int.parse(Get.arguments['laptopPrice']);
    final arguments = Get.arguments;
    final LaptopDetailModel laptop = arguments['laptop'];
    detailLaptop.value = laptop;
  }

  void updateSelectedPayment(String paymentMethod) {
    selectedPaymentMethod.value = paymentMethod;
    paymentController.text = paymentMethod;
  }

  /// Fungsi untuk menghitung sub total harga
  void calculateSubTotal() {
    subTotalPrice.value = laptopPrice.value * durationDays.value;
    calculateGrandTotal();
  }

  /// Fungsi untuk menghitung grand total harga
  void calculateGrandTotal() {
    grandTotalPrice.value = subTotalPrice.value + serviceFee;
  }

  /// Fungsi untuk memilih dropdown keperluan sewa
  void onRentNeedChanged(String? value) {
    if (value != null) {
      selectedRentNeed.value = value;
    }
  }

  /// Fungsi untuk memilih tanggal
  Future<void> pickDate(
      TextEditingController editingController, bool isStartDate) async {
    final pickedDate = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      initialDate: DateTime.now(),
    );

    if (pickedDate != null) {
      editingController.text = DateFormat('dd MMM yyyy').format(pickedDate);
      if (isStartDate) {
        startDate.value = pickedDate;
      } else {
        endDate.value = pickedDate;
      }
      // Hitung durasi setelah update tanggal
      calculateDuration();
    }
  }

  /// Fungsi untuk menghitung durasi
  void calculateDuration() {
    if (startDate.value != null && endDate.value != null) {
      if (endDate.value!.isBefore(startDate.value!)) {
        // Validasi jika tanggal akhir sebelum tanggal mulai
        Get.snackbar(
            'Error', 'Tanggal akhir tidak boleh sebelum tanggal mulai');
        durationDays.value = 0;
        subTotalPrice.value = 0;
        grandTotalPrice.value = 0;
        return;
      }
      // Termasuk hari pertama
      durationDays.value =
          endDate.value!.difference(startDate.value!).inDays + 1;
      calculateSubTotal();
    }
  }

  Future<String?> showFingerprintDialog() async {
    final result = await Get.defaultDialog(
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      radius: 30,
      content: const FingerPrintDialogComponent(),
    );

    return result;
  }

  Future<void> showPinDialog() async {
    const userPin = '123456';

    final bool? authenticated = await Get.defaultDialog(
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      radius: 30,
      content: const PinDialogComponent(pin: userPin),
    );

    if (authenticated == true) {
      // if succeed, order cart
      isVerified.value = true;
    } else if (authenticated != null) {
      Get.until(ModalRoute.withName(Routes.checkoutRoute));
    }
  }

  Future<void> verify() async {
    // check supported auth type in device
    final LocalAuthentication localAuth = LocalAuthentication();
    final bool canCheckBiometrics = await localAuth.canCheckBiometrics;
    final bool isBiometricSupported = await localAuth.isDeviceSupported();

    if (canCheckBiometrics && isBiometricSupported) {
      try {
        // open fingerprint dialog if supported
        final String? authType = await showFingerprintDialog();
        print('auth type: ${authType}');

        if (authType == 'fingerprint') {
          // fingerprint auth flow
          final bool authenticated = await localAuth.authenticate(
            localizedReason: 'Please authenticate to confirm order'.tr,
            options: const AuthenticationOptions(
              biometricOnly: true,
            ),
          );

          // if succeed, order cart
          if (authenticated) {
            isVerified.value = true;
          }
        } else if (authType == 'pin') {
          // pin auth flow
          print('pin dialog');
          await showPinDialog();
        }
      } on PlatformException catch (e) {
        log('Biometric Exception: $e');
      }
    } else {
      print('pin 2 dialog');
      await showPinDialog();
    }
  }
}
