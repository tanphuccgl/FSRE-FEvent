import 'package:dio/dio.dart';
import 'package:fevent/src/config/constants/endpoints.dart';
import 'package:fevent/src/utils/helper/logger.dart';

class BaseDataSource {
  // dio instance
  final Dio _dio = Dio();

  // injecting dio instance
  BaseDataSource();

  // Get:-----------------------------------------------------------------------
  Future<Response> get<T>(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio
          .get(
            uri,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          )
          .timeout(const Duration(milliseconds: Endpoints.connectionTimeout));
      LoggerHelper.successApi('> GET RESPONSE [${response.statusCode}]<  $uri');

      return response;
    } catch (e) {
      LoggerHelper.errorApi('> API CATCH Error< $e');
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio
          .post(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          )
          .timeout(const Duration(milliseconds: Endpoints.connectionTimeout));
      LoggerHelper.successApi(
        '> POST RESPONSE [${response.statusCode}]< $uri $data',
      );

      return response;
    } catch (e) {
      LoggerHelper.errorApi('> API CATCH Error< $e');
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<Response> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio
          .put(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          )
          .timeout(const Duration(milliseconds: Endpoints.connectionTimeout));
      LoggerHelper.successApi(
        '> PUT RESPONSE [${response.statusCode}]< $uri $data',
      );

      return response;
    } catch (e) {
      LoggerHelper.errorApi('> API CATCH Error< $e');

      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<Response> delete<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio
          .delete(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
          )
          .timeout(const Duration(milliseconds: Endpoints.connectionTimeout));
      LoggerHelper.successApi(
        '> DELETE RESPONSE [${response.statusCode}]< $uri $data',
      );

      return response;
    } catch (e) {
      LoggerHelper.errorApi('> API CATCH Error< $e');
      rethrow;
    }
  }
}
