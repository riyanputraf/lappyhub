import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckoutController extends GetxController {
  static CheckoutController get to => Get.find();

  var startDateController = TextEditingController();
  var endDateController = TextEditingController();

  var paymentController = TextEditingController();
  final RxString selectedPaymentMethod = ''.obs;

  final Rxn<DateTime> startDate = Rxn<DateTime>();
  final Rxn<DateTime> endDate = Rxn<DateTime>();
  final RxInt durationDays = 0.obs;

  final RxList<String> rentNeedOptions = [
    'Acara khusus',
    'Penelitian',
    'Pembelajaran',
    'Keperluan pribadi',
  ].obs;

  final RxString selectedRentNeed = 'Acara khusus'.obs;

  final RxInt laptopPrice = 0.obs;

  // Biaya jasa aplikasi
  final int serviceFee = 2000;

  final RxInt subTotalPrice = 0.obs;
  final RxInt grandTotalPrice = 0.obs;

  @override
  void onInit() {
    super.onInit();
    laptopPrice.value = int.parse(Get.arguments['laptopPrice']);
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
  Future<void> pickDate(TextEditingController editingController, bool isStartDate) async {
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
        Get.snackbar('Error', 'Tanggal akhir tidak boleh sebelum tanggal mulai');
        durationDays.value = 0;
        subTotalPrice.value = 0;
        grandTotalPrice.value = 0;
        return;
      }
      // Termasuk hari pertama
      durationDays.value = endDate.value!.difference(startDate.value!).inDays + 1;
      calculateSubTotal();
    }
  }
}
