import 'package:dio/dio.dart';

class ClientHttpInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    print("REQUEST[${options.method}] => PATH: ${options.path}");
    return options;
  }

  @override
  Future onResponse(Response response) async {
    print("RESPONSE[${response.statusCode}] => PATH: ${response.request.path}");
    return response;
  }

  @override
  Future onError(DioError err) async {
    //Exception
    print("ERROR[${err.response.statusCode}] => PATH: ${err.request.path}");
    if (err.response.statusCode == 404) return DioError(error: "Erro interno");

    return err;
  }
}
