import 'package:dio/dio.dart';

import '../util/logger.dart';

/// [Service]는 비지니스 로직, 외부와의 연결을 담당을 담당하는 계층입니다.
/// Repository에서 가져온 데이터를 처리하고 규칙을 적용합니다.
/// 사용자 인증, 복잡한 계산, 여러 소스에서 온 데이터의 통합 등이 이루어집니다.
/// 일반적으로 비지니스 로직 또는 앱의 전역 상태등을 담당합니다.
/// 애플리케이션의 규모가 큰 경우 데이터를 관리하고 처리하는 로직을 캡슐화하여 ViewModel과 Model 간의 연결 고리 역할을 하게 됩니다.
/// Repository가 백엔드와 통신하고 Service가 Repository에 접근하여 ViewModel에 데이터를 가져다 주는 것.
class DioService {
  static Dio _dio = Dio();

  static final DioService _dioService = DioService._internal();
  factory DioService() => _dioService;

  DioService._internal() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
      sendTimeout: const Duration(milliseconds: 10000),
    );
    _dio = Dio(options);
    _dio.interceptors.add(DioInterceptor());
  }

  Dio to() => _dio;
}

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // logger.e("BaseUrl ${options.baseUrl}");
    // logger.e("Path ${options.path}");
    // logger.e("Parameters ${options.queryParameters}");
    // logger.e("Data ${options.data}");
    // logger.e("Connect Timeout ${options.connectTimeout}");
    // logger.e("Send Timeout ${options.sendTimeout}");
    // logger.e("Receive Timeout ${options.receiveTimeout}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // logger.e(response.statusCode);
    // logger.e(response.data);
    // logger.e("BaseUrl ${response.requestOptions.baseUrl}");
    // logger.e("Path ${response.requestOptions.path}");
    // logger.e("Parameters ${response.requestOptions.queryParameters}");
    // logger.e("Data ${response.requestOptions.data}");
    // logger.e("Connect Timeout ${response.requestOptions.connectTimeout}");
    // logger.e("Send Timeout ${response.requestOptions.sendTimeout}");
    // logger.e("Receive Timeout ${response.requestOptions.receiveTimeout}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    logger.e("Error ${err.error}");
    logger.e("Error Message ${err.message}");
    super.onError(err, handler);
  }
}

enum Failure {
  networkErr,
  serverErr,
  unknown;

  String get message {
    switch (this) {
      case networkErr:
        return '네트워크 오류';
      case serverErr:
        return '서버 오류';
      case unknown:
        return '알 수 없는 오류';
    }
  }
}
