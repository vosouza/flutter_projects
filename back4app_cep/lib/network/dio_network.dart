import 'package:dio/dio.dart';

class InterceptorDIO extends InterceptorsWrapper{
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("onResponse  => $response");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("onResponse  => $err");
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("onResponse  => $options");
    super.onRequest(options, handler);
  }
}