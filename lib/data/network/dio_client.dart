import 'package:dio/dio.dart';
import 'package:ft_chetak_books/data/network/logger/pretty_dio_logger.dart';
import 'package:ft_chetak_books/package/config_packages.dart';

late Dio dio;
late RestClient apiClient;
String  proxy="";

BaseOptions baseOptions = BaseOptions(
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30));

 String baseUrl =
     'https://arc.shellcode.co.in/api/';

Future<void> dioSetUp({int? language}) async {
  dio = Dio(baseOptions);

  dio.interceptors.add(InterceptorsWrapper(onRequest:
      (RequestOptions option, RequestInterceptorHandler handler) async {
    var customHeaders = {
      'Accept': '*/*',
      'Content-Type': 'application/json',
      if(AppPref().token.isNotEmpty)
        if (AppPref().token.isNotEmpty) 'Authorization': 'Bearer ${AppPref().token}',
    };
    option.headers.addAll(customHeaders);
    handler.next(option);
  }));

  /// PreDioLogger to print api log in DEBUG mode
  if (!kReleaseMode) {
    var logger = PrettyDioLogger(
      maxWidth: 232,
      requestHeader: true,
      requestBody: true,
    );
    dio.interceptors.add(logger);
  }

  dio.options.baseUrl = baseUrl;
}
