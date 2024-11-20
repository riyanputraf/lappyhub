
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lappyhub/features/checkout/models/checkout_order_model.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../utils/services/dio_service.dart';
import '../constants/checkout_api_constant.dart';

class CheckoutRepository {
  CheckoutRepository._();

  var apiConstant = CheckoutApiConstant();

  late final Dio dio;

  CheckoutRepository() {
    dio = DioService.dioCall();
  }

  Future<bool> createOrder(CheckoutOrderModel order) async {
    try {
      final response = await dio.post(
        '/orders',
        data: order.toJson(),
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        log('Error create order laptop: Status Code ${response.statusCode}');
        await Sentry.captureException(
          response.statusCode,
        );
        throw Exception('Failed to create order');
      }
    } catch (exception, stackTrace) {
      log('Post Error: ${exception.toString()}');
      log('Stack Trace: ${stackTrace.toString()}');
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      throw Exception('Error creating order: $exception');
    }
  }
}
