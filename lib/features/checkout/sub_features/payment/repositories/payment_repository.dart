
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lappyhub/features/checkout/sub_features/payment/models/payment_model.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../../utils/services/dio_service.dart';
import '../../../constants/checkout_api_constant.dart';

class PaymentRepository {
  PaymentRepository._();

  var apiConstant = CheckoutApiConstant();

  late final Dio dio;

  PaymentRepository() {
    dio = DioService.dioCall();
  }

  Future<List<PaymentModel>> fetchPaymentMethods() async {
    try {
      final response = await dio.get('/payments');
      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        return data.map((item) => PaymentModel.fromJson(item)).toList();
      } else {
        log('Fetch Error: Status Code ${response.statusCode}');
        await Sentry.captureException(
          response.statusCode,
        );
        throw Exception('Failed to fetch payment methods');
      }
    } catch (exception, stackTrace) {
      log('Fetch Error: ${exception.toString()}');
      log('Stack Trace: ${stackTrace.toString()}');
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      throw Exception('Error: $exception');
    }
  }
}
