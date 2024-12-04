import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../utils/services/dio_service.dart';
import '../constants/order_api_constant.dart';
import '../models/order_model.dart';

class OrderRepository {
  OrderRepository._();

  var apiConstant = OrderApiConstant();

  late final Dio dio;

  OrderRepository() {
    dio = DioService.dioCall();
  }

  Future<List<OrderModel>> fetchOrdersByUserId(String userId,
      {int page = 1, int? status}) async {
    try {
      final queryParameters = {
        'page': page,
        'limit': 10,
        'orderBy': 'order_date',
        'order': 'desc',
      };

      if (status != null) {
        queryParameters['status'] = status;
      }

      final response = await dio.get(
        '/users/$userId/orders',
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        return data.map((json) => OrderModel.fromJson(json)).toList();
      } else if (response.statusCode == 404) {
        return [];
      } else {
        log('Fetch Error Order: Status Code ${response.statusCode}');
        await Sentry.captureException(
          response.statusCode,
        );
        throw Exception('Unexpected status code: ${response.statusCode}');
      }
    } on DioException catch (dioException, stackTrace) {
      if (dioException.response?.statusCode == 404) {
        log('Order result not found (404)');
        return [];
      } else {
        log('Fetch Order DioError: ${dioException.message}');
        await Sentry.captureException(
          dioException,
          stackTrace: stackTrace,
        );
        throw Exception('Network error occurred: ${dioException.message}');
      }
    } catch (exception, stackTrace) {
      log('Fetch Search Error Exception: ${exception.toString()}');
      log('Stack Trace Exception: ${stackTrace.toString()}');
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      throw Exception('Unexpected error: $exception');
    }
  }
}
