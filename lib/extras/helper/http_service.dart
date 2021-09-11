import 'package:dio/dio.dart';
import 'package:hacker_news/extras/constants/constants.dart';

class HttpService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  Future<Response> getRequest({
    required String endPoint,
  }) async {
    Response response;

    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      throw Exception(e.message);
    }

    return response;
  }
}
