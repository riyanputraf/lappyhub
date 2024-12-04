
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../../utils/services/dio_service.dart';
import '../../../constants/order_api_constant.dart';
import '../models/detail_order_model.dart';

class DetailOrderRepository {
  DetailOrderRepository._();

  var apiConstant = OrderApiConstant();

  late final Dio dio;

  DetailOrderRepository() {
    dio = DioService.dioCall();
  }

  Future<DetailOrderModel> fetchDetailOrder(String userId, int id) async {
    final response = await dio.get('/users/$userId/orders/$id');
    try {
      if (response.statusCode == 200) {
        return DetailOrderModel.fromJson(response.data['data']);
      } else {
        log('Fetch Error detail order: Status Code ${response.statusCode}');
        await Sentry.captureException(
          response.statusCode,
        );
        throw Exception("Failed to fetch order detail");
      }
    } catch (exception, stackTrace) {
      log('Fetch Error: ${exception.toString()}');
      log('Stack Trace: ${stackTrace.toString()}');
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      throw Exception('Error fetching detail order: $exception');
    }
  }
}
