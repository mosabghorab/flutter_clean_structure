import 'package:dio/dio.dart';
import 'package:new_streamline/src/core/networking/api_constants.dart';
import 'package:new_streamline/src/core/networking/custom_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class DioFactory {
  static Dio init() => Dio(
        BaseOptions(
          baseUrl: ApiConstants.apiBaseurl,
          receiveTimeout: const Duration(seconds: ApiConstants.receiveTimeout),
          connectTimeout: const Duration(seconds: ApiConstants.connectTimeout),
          sendTimeout: const Duration(seconds: ApiConstants.sendTimeout),
          contentType: Headers.jsonContentType,
          validateStatus: (statusCode) => true,
        ),
      )
        ..interceptors.add(CustomInterceptor())
        ..interceptors.add(PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
        ));
}
