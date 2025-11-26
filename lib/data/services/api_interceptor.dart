import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  final Dio client;

  ApiInterceptor(this.client);
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if(err.response?.statusCode==401){
      
    }
    super.onError(err, handler);
  }
}
