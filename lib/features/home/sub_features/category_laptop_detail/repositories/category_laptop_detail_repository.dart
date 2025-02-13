
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../../utils/services/dio_service.dart';
import '../../../constants/home_api_constant.dart';
import '../../../models/laptop_model.dart';

class CategoryLaptopDetailRepository {
  CategoryLaptopDetailRepository._();

  var apiConstant = HomeApiConstant();

  late final Dio dio;

  CategoryLaptopDetailRepository() {
    dio = DioService.dioCall();
  }

  Future<List<LaptopModel>> fetchLaptopsByCategory(String categoryName) async {
    try {
      final response = await dio.get(
        '/laptops',
        queryParameters: {'category': categoryName},
      );
      if (response.statusCode == 200) {
        return (response.data['data'] as List)
            .map((item) => LaptopModel.fromJson(item))
            .toList();
      } else if(response.statusCode == 404){
        log('Laptop category not found');
        return [];
      } else {
        log('Fetch Error category laptop: Status Code ${response.statusCode}');
        await Sentry.captureException(
          response.statusCode,
        );
        throw Exception('Failed to fetch laptops by category');
      }
    } catch (exception, stackTrace) {
      log('Fetch Error: ${exception.toString()}');
      log('Stack Trace: ${stackTrace.toString()}');
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      return [];
    }
  }
}
