import 'package:dio/dio.dart';
import 'package:qqmusic/net/response/base_response.dart' show BaseResponse;
import 'package:qqmusic/tools/logger.dart';

///日志拦截器
class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Logger.instance.d(
      'API Request [${options.method}] ${options.uri.toString()}',
    );
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //返回自定义的Base
    final baseResponse = BaseResponse(
      code: response.statusCode,
      msg: response.statusMessage,
      data: response.data,
    );
    response.data = baseResponse;
    Logger.instance.d(
      'API Response [${response.realUri}] ${response.statusCode} ${response.statusMessage}',
    );
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    //处理错误信息
    handlerError(err);
    StringBuffer buffer = StringBuffer();
    buffer.write('⌈‾‾ Error (っ °Д °;)っ\n');
    buffer.write('| \n');
    buffer.write('| - ExceptionType：${err.type.name}\n');
    buffer.write('| - ErrorMsg：     ${err.message}\n');
    buffer.write('| - StatusCode：   ${err.response?.statusCode}\n');
    buffer.write('| - StatusMsg：    ${err.response?.statusMessage}\n');
    buffer.write(
      '⌊_____________________________________________________________________',
    );
    Logger.instance.e(buffer.toString());
    return handler.next(err);
  }

  ///处理错误信息 --自行去实现里面的功能代码
  void handlerError(DioException err) {
    switch (err.type) {
      //连接超时
      case DioExceptionType.connectionTimeout:
        break;
      //响应超时
      case DioExceptionType.receiveTimeout:
        break;
      //发送超时
      case DioExceptionType.sendTimeout:
        break;
      //请求取消
      case DioExceptionType.cancel:
        break;
      //错误响应 404 等
      case DioExceptionType.badResponse:
        break;
      //错误证书
      case DioExceptionType.badCertificate:
        break;
      //未知错误
      default:
        break;
    }
  }

  // void printDebugLog(StringBuffer buffer) {
  //   if (kDebugMode) {
  //     print(buffer.toString());
  //   }
  // }
}
