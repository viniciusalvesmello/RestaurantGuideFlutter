import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import 'client_http_interceptor.dart';

abstract class IClientHttpService {
  Future get(String path);
}

class ClientHttpService implements IClientHttpService {
  final Dio dio = Dio();

  ClientHttpService() {
    dio.options.baseUrl = "https://developers.zomato.com";
    dio.options.headers["user-key"] = "99d85dafb334326b340619884974a285";
    dio.interceptors.add(ClientHttpInterceptor());
  }

  @override
  Future get(String path) async {
    var response = await dio.get(path);
    return response.data;
  }
}
