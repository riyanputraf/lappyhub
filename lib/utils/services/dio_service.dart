import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lappyhub/shared/controllers/global_controller.dart';

class DioService {
  DioService._();

  static final DioService dioService = DioService._();

  factory DioService() {
    return dioService;
  }

  static const int timeoutInMiliSeconds = 60000;

  static Dio dioCall({
    bool isSignature = true,
    bool isMockApi = false,
    String? tempToken,
    int timeout = timeoutInMiliSeconds,
    bool isNoTimeOut = false,
    bool isV2 = false,
  }) {
    var dio = Dio(
      BaseOptions(
        baseUrl: "https://venturo.id/",
        connectTimeout: const Duration(milliseconds: 5000),
        responseType: ResponseType.json,
        sendTimeout: isNoTimeOut ? null : Duration(milliseconds: timeout),
        receiveTimeout: isNoTimeOut ? null : Duration(milliseconds: timeout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(_authInterceptor(
      isSignature: isSignature,
      tempToken: tempToken,
    ));

    return dio;
  }

  static Interceptor _authInterceptor({
    bool isSignature = true,
    String? tempToken,
  }) {
    return QueuedInterceptorsWrapper(
      onRequest: (reqOptions, handler) async {
        final isConnect = await GlobalController.to.checkConnection();
        if (!isConnect) {
          return handler.reject(DioException.connectionError(
              requestOptions: reqOptions,
              reason: "Check Your Connection",
              error: {"message": "Check your internet connection"}));
        }

        log('${reqOptions.uri}', name: 'REQUEST URL');
        log('${reqOptions.headers}', name: 'HEADER');
        log('${reqOptions.data}', name: 'DATA');

        return handler.next(reqOptions);
      },
      onError: (error, handler) async {
        log('${error.response}', name: 'RESPONSE');
        log('${error.response?.statusCode}', name: 'STATUS CODE');
        log('${error.requestOptions.uri}', name: 'ERROR FROM URL');

        if (error.response?.statusCode == 401) {
          /// TODO : Handle your 401 status code

          return;
        }
        if (error.response?.statusCode == 403) {
          /// TODO : Handle your 403 status code
          return;
        }
        if (error.response?.statusCode == 503 ||
            error.response?.statusCode == 531 ||
            error.response?.statusCode == 520 ||
            error.response?.statusCode == 521 ||
            error.response?.statusCode == 523) {
          /// TODO : Handle your 500 ish status code
          return;
        }

        return handler.next(error); //return non 401 error
      },
      onResponse: (response, handler) async {
        log('${response.requestOptions.uri}', name: 'RESPONSE FROM URL');
        log('${response.data}', name: 'RESPONSE');

        return handler.resolve(response);
      },
    );
  }
}
