import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lappyhub/shared/controllers/global_controller.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class DioService {
  DioService._();

  static final DioService dioService = DioService._();

  factory DioService() {
    return dioService;
  }

  static const Duration timeoutInMiliSeconds = Duration(
    seconds: 20000,
  );

  static Dio dioCall({
    Duration timeout = timeoutInMiliSeconds,
    String? token,
    String? authorization,
  }) {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (token != null) {
      headers['token'] = token;
    }

    if (authorization != null) {
      headers['Authorization'] = authorization;
    }

    var dio = Dio(
      BaseOptions(
        headers: headers,
        baseUrl: GlobalController.to.baseUrl,
        connectTimeout: timeoutInMiliSeconds,
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.add(_authInterceptor());

    return dio;
  }

  static Interceptor _authInterceptor() {
    return QueuedInterceptorsWrapper(
      onRequest: (reqOptions, handler) {
        log('${reqOptions.uri}', name: 'REQUEST URL');
        log('${reqOptions.headers}', name: 'HEADER');

        return handler.next(reqOptions);
      },
      onError: (error, handler) async {
        log(error.message.toString(), name: 'ERROR MESSAGE');
        log('${error.response}', name: 'RESPONSE');
        await Sentry.captureException(
          error,
        );

        return handler.next(error);
      },
      onResponse: (response, handler) async {
        log('${response.data}', name: 'RESPONSE');

        return handler.resolve(response);
      },
    );
  }
}
