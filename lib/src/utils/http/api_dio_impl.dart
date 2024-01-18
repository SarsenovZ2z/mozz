import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:mozz/src/common/domain/entities/failure.dart';
import 'package:mozz/src/utils/http/api.dart';

class ApiDioImpl implements Api {
  String? _accessToken;

  // String? _refreshToken;
  late final Dio httpClient;

  ApiDioImpl({String? accessToken}) {
    _accessToken = accessToken;
    httpClient = Dio(
      BaseOptions(
        listFormat: ListFormat.multiCompatible,
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    httpClient.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_accessToken != null) {
            options.headers['Authorization'] = "Bearer $_accessToken";
          }

          debugPrint(
              '${DateFormat('HH:mm:ss').format(DateTime.now())} sending request to: ${options.path}');

          return handler.next(options);
        },
      ),
    );
  }

  @override
  Api usingAccessToken(String? accessToken) => ApiDioImpl(
        accessToken: accessToken,
      );

  @override
  bool get isSignedIn => _accessToken != null;

  @override
  Future<Response<T>> request<T>(
    HTTPMethod method,
    String path, {
    Map<String, dynamic>? data,
  }) {
    return _request<T>(
      method,
      path,
      data: data,
    ).catchError((error) {
      if (error is DioError) {
        final message = error.response?.data['message'];

        if (message is String) {
          throw UnexpectedFailure(message);
        }
      }
    });
  }

  Future<Response<T>> _request<T>(
    HTTPMethod method,
    String path, {
    Map<String, dynamic>? data,
  }) {
    switch (method) {
      case HTTPMethod.get:
        return httpClient.get<T>(path, queryParameters: data);
      case HTTPMethod.post:
        return httpClient.post<T>(path, data: data);
      case HTTPMethod.put:
        return httpClient.put<T>(path, data: data);
      case HTTPMethod.delete:
        return httpClient.delete<T>(path, data: data);
      default:
        throw UnimplementedError();
    }
  }

  @override
  void setAccessToken(String? accessToken) {
    _accessToken = accessToken;
  }

  @override
  String? getAccessToken() {
    return _accessToken;
  }

  @override
  void setRefreshToken(String? refreshToken) {
    // _refreshToken = refreshToken;
  }
}
