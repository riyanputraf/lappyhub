import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../utils/services/dio_service.dart';
import '../constants/home_api_constant.dart';
import '../models/category_model.dart';
import '../models/laptop_model.dart';

class HomeRepository {
  HomeRepository._();

  var apiConstant = HomeApiConstant();

  late final Dio dio;

  HomeRepository() {
    dio = DioService.dioCall();
  }

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await dio.get('/categories');
      if (response.statusCode == 200) {
        return (response.data['data'] as List)
            .map((item) => CategoryModel.fromJson(item))
            .toList();
      } else {
        log('Fetch Error Category: Status Code ${response.statusCode}');
        await Sentry.captureException(
          response.statusCode,
        );
        throw Exception("Failed to fetch categories");
      }
    } catch (exception, stackTrace) {
      log('Fetch Error Category: ${exception.toString()}');
      log('Stack Trace: ${stackTrace.toString()}');
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      throw Exception('Error fetching category: $exception');
    }
  }

  Future<List<LaptopModel>> fetchPopularLaptops() async {
    try {
      final response = await dio.get('/laptops');

      if (response.statusCode == 200) {
        return (response.data['data'] as List)
            .map((json) => LaptopModel.fromJson(json))
            .toList();
      } else {
        log('Fetch Error: Status Code ${response.statusCode}');
        await Sentry.captureException(
          response.statusCode,
        );
        throw Exception('Failed to fetch laptops');
      }
    } catch (exception, stackTrace) {
      log('Fetch Error: ${exception.toString()}');
      log('Stack Trace: ${stackTrace.toString()}');
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      throw Exception('Error fetching laptops: $exception');
    }
  }

  Future<List<LaptopModel>> fetchListLaptops({int page = 1}) async {
    try {
      final response = await dio.get(
        '/laptops',
        queryParameters: {'page': page, 'limit': 5},
      );

      if (response.statusCode == 200) {
        return (response.data['data'] as List)
            .map((json) => LaptopModel.fromJson(json))
            .toList();
      } else {
        log('Fetch Error: Status Code ${response.statusCode}');
        await Sentry.captureException(
          response.statusCode,
        );
        throw Exception('Failed to fetch laptops');
      }
    } catch (exception, stackTrace) {
      log('Fetch Error: ${exception.toString()}');
      log('Stack Trace: ${stackTrace.toString()}');
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      throw Exception('Error fetching laptops: $exception');
    }
  }
}
