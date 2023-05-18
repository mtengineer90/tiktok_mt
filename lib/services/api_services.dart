import 'package:dio/dio.dart';

class APIServices {
  APIServices._internal();

  factory APIServices() => _selfInstance;
  static final APIServices _selfInstance = APIServices._internal();
  final _dio = Dio();

  Future<Response> get(String url) async {
    try {
      return await _dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
    } on Exception catch (_) {
      rethrow;
    }
  }
}
