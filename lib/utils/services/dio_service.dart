import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dolang/shared/controllers/global_controller.dart';
import 'package:get/get.dart';

class DioService extends GetxService {
  DioService._();

  /// Singleton instance
  static final DioService dioService = DioService._();

  /// Factory method to get the singleton instance
  factory DioService() {
    return dioService;
  }

  /// Default timeout for dio call
  static const Duration timeOutInMiliSeconds = Duration(
    seconds: 20000,
  );

  /// Dio call with default headers
  static Dio dioCall({
    Duration timeout = timeOutInMiliSeconds,
    String? token,
    String? authorization,
  }) {
    /// Default headers
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    /// Add token header if available
    if (token != null) {
      headers['token'] = token;
    }

    /// Add authorization header if available
    if (authorization != null) {
      headers['Authorization'] = authorization;
    }

    /// Create Dio instance
    var dio = Dio(
      BaseOptions(
        headers: headers,
        baseUrl: GlobalController.to.baseUrl,
        connectTimeout: timeOutInMiliSeconds,
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );

    /// Add interceptor
    dio.interceptors.add(_authInterceptor());

    return dio;
  }

  /// Interceptor for dio
  static Interceptor _authInterceptor() {
    return QueuedInterceptorsWrapper(
      /// Log request and response
      onRequest: (reqOptions, handler) {
        log('${reqOptions.uri}', name: 'REQUEST URL');
        log('${reqOptions.headers}', name: 'HEADER');

        return handler.next(reqOptions);
      },

      /// Log error and response
      onError: (error, handler) async {
        log(error.message.toString(), name: 'ERROR MESSAGE');
        log('${error.response}', name: 'RESPONSE');

        return handler.next(error);
      },

      /// Log response
      onResponse: (response, handler) async {
        log('${response.data}', name: 'RESPONSE');

        return handler.resolve(response);
      },
    );
  }
}
