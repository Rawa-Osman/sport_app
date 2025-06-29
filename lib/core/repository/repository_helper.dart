import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sport_app/core/di/di_config.dart';
import 'package:sport_app/core/error/exceptions.dart';
import 'package:sport_app/core/network/internet_checker.dart';


class RepositoryHelper {
  Future<Either<AppException, T>> request<T>({
    required Future<Either<AppException, T>> Function() body,
  }) async {
    try {
      if (!await getIt<InternetChecker>().isConnected()) {
        return left(NoInternetException());
      }
      return await body();
    } on DioException catch (err) {
      // debugPrint("err = ${err.response?.data}");
      debugPrint("""
DIO ERROR:
- URL: ${err.requestOptions.uri}
- Path: ${err.requestOptions.path}
- Error Data: ${err.response?.data}
""");

      if (err.type == DioExceptionType.sendTimeout ||
          err.type == DioExceptionType.connectionTimeout ||
          err.type == DioExceptionType.receiveTimeout ||
          err.type == DioExceptionType.connectionError) {
        return left(NoInternetException());
      } else if (err.type == DioExceptionType.cancel ||
          err.type == DioExceptionType.unknown) {
        return left(ServerException());
      } else if (err.type == DioExceptionType.badResponse) {
        return left(handleBadResponseError(err.response));
      } else {
        return left(ServerException());
      }
    } on Exception catch (e) {
      debugPrint("Exception in RepositoryHelper class ${e.toString()} ");
      return left(ServerException());
    } on Error catch (e) {
      debugPrint("Error in RepositoryHelper class ${e.toString()} ");
      debugPrint("Error in RepositoryHelper class ${e.stackTrace} ");
      return left(ErrorException(error: e));
    }
  }

  AppException handleBadResponseError(Response<dynamic>? response) {
  if (response == null) {
    return ServerException();
  }

  try {
    if (response.data is Map<String, dynamic>) {
      final map = response.data as Map<String, dynamic>;
      if (map.containsKey('error_msg')) {
        final errorMsg = map["error_msg"] as String;
        return ClientSideException(msg: errorMsg);
      } else {
        return ServerException(statusCode: response.statusCode ?? 500);
      }
    } else {
      return ServerException(statusCode: response.statusCode ?? 500);
    }
  } catch (e) {
    return ServerException(statusCode: response.statusCode ?? 500);
  }
}

}


