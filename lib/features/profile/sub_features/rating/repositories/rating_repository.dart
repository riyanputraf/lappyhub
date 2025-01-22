import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../../utils/services/dio_service.dart';

class RatingRepository {
  RatingRepository._();

  late final Dio dio;

  RatingRepository() {
    dio = DioService.dioCall();
  }

  Future<bool> submitReview(int rating, String feedback) async {
    try {
      final data = {
        "rating": rating,
        "feedback": feedback,
      };
      final response = await dio.post('/reviews', data: data);
      if (response.statusCode == 201) {
        return true;
      } else {
        log('Error send data: Status Code ${response.statusCode}');
        await Sentry.captureException(
          response.statusCode,
        );
        throw Exception("Failed to send data");
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
