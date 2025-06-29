

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sport_app/core/constants/api_constants.dart';


class DioConfig {
  late Dio dio;
  void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          'Content-Type': 'application/json',
        },
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.add(CustomInterceptor());
    dio.interceptors.add(
      LogInterceptor(
        logPrint: (object) => debugPrint(object.toString()),
      ),
    );
  }
}

class CustomInterceptor implements Interceptor {
  @override
  void onError(DioException err, handler) {
    debugPrint("------- Error ------");
    debugPrint(err.type.toString());
    debugPrint(err.toString());

    return handler.reject(err);
  }

  @override 
  void onRequest(RequestOptions options, handler) async {

    return handler.next(options);
  }

  @override
  void onResponse(Response response, handler) {
    debugPrint("------- Response ------");
    debugPrint(response.data.toString());
    return handler.resolve(response);
  }
}
