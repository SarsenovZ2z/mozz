enum HTTPMethod { get, post, delete, put, patch }

abstract class Api {

  Future<dynamic> request<T>(
    HTTPMethod method,
    String path, {
    Map<String, dynamic>? data,
  });

  void setAccessToken(String? accessToken);

  String? getAccessToken();

  void setRefreshToken(String? refreshToken);

  Api usingAccessToken(String? accessToken);

  bool get isSignedIn;
}
