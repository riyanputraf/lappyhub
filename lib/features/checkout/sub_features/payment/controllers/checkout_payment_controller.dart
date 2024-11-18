import 'package:get/get.dart';

import '../models/payment_model.dart';
import '../repositories/payment_repository.dart';

class CheckoutPaymentController extends GetxController {
  static CheckoutPaymentController get to => Get.find();

  var paymentMethods = <PaymentModel>[].obs;
  var isLoading = 'idle'.obs;

  var selectedPaymentId = ''.obs;

  late final PaymentRepository paymentRepository;

  @override
  void onInit() {
    super.onInit();
    paymentRepository = PaymentRepository();
    fetchVouchers();
  }

  Future<void> fetchVouchers() async {
    try {
      isLoading.value = 'loading';
      final fetchedVouchers = await paymentRepository.fetchPaymentMethods();
      paymentMethods.value = fetchedVouchers;
      isLoading.value = 'success';
    } catch (e) {
      Get.snackbar('Error', 'Failed to load vouchers');
    }
  }

  void selectPayment(String id) {
    selectedPaymentId.value = id;
  }

  PaymentModel? getSelectedPayment() {
    return paymentMethods
        .firstWhereOrNull((payment) => payment.id == selectedPaymentId.value);
  }
}
