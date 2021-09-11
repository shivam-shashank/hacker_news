import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hacker_news/extras/helper/http_service.dart';
import 'package:hacker_news/response/news_details/news_details_response.dart';

class NewsDetailsProvider extends ChangeNotifier {
  final HttpService _httpService = HttpService();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  NewsDetailsResponse _newsDetailsResponse = NewsDetailsResponse();

  NewsDetailsResponse get newsDetailsResponse => _newsDetailsResponse;

  set newsDetailsResponse(NewsDetailsResponse value) {
    _newsDetailsResponse = value;
    notifyListeners();
  }

  Future<void> fetchNewsDetails(String objectID) async {
    _isLoading = true;

    try {
      Response response = await _httpService.getRequest(
        endPoint: "items/$objectID",
      );

      if (response.statusCode == 200) {
        newsDetailsResponse = NewsDetailsResponse.fromJson(response.data);

        print(newsDetailsResponse.toJson());
      }

      _isLoading = false;
    } on Exception catch (e) {
      _isLoading = false;
      throw Exception(e);
    }

    notifyListeners();
  }
}
