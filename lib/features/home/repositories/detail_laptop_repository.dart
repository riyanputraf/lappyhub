import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../utils/services/dio_service.dart';
import '../constants/home_api_constant.dart';
import '../models/laptop_detail_model.dart';

class DetailLaptopRepository {
  DetailLaptopRepository._();

  var apiConstant = HomeApiConstant();

  late final Dio dio;

  DetailLaptopRepository() {
    dio = DioService.dioCall();
  }

  Future<LaptopDetailModel> fetchLaptopDetail(int id) async {
    final response = await dio.get('/laptops/$id');
    try {
      if (response.statusCode == 200) {
        return LaptopDetailModel.fromJson(response.data['data']);
      } else {
        log('Fetch Error detail laptop: Status Code ${response.statusCode}');
        await Sentry.captureException(
          response.statusCode,
        );
        throw Exception("Failed to fetch laptop detail");
      }
    } catch (exception, stackTrace) {
      log('Fetch Error: ${exception.toString()}');
      log('Stack Trace: ${stackTrace.toString()}');
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      throw Exception('Error fetching detail laptops: $exception');
    }
  }
}
