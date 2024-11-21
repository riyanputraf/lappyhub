import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../../utils/services/dio_service.dart';
import '../../../constants/home_api_constant.dart';
import '../../../models/laptop_model.dart';

class SearchLaptopRepository {
  SearchLaptopRepository._();

  var apiConstant = HomeApiConstant();

  late final Dio dio;

  SearchLaptopRepository() {
    dio = DioService.dioCall();
  }

  Future<List<LaptopModel>> fetchSearchResults(String query) async {
    try {
      final response = await dio.get(
        '/laptops',
        queryParameters: {'search': query},
      );
      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        return data.map((item) => LaptopModel.fromJson(item)).toList();
      } else if (response.statusCode == 404) {
        return [];
      } else {
        log('Fetch Search Error: Status Code ${response.statusCode}');
        await Sentry.captureException(
          response.statusCode,
        );
        throw Exception('Unexpected status code: ${response.statusCode}');
      }
    } on DioException catch (dioException, stackTrace) {
      if (dioException.response?.statusCode == 404) {
        log('Search result not found (404)');
        return [];
      } else {
        log('Fetch Search DioError: ${dioException.message}');
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
