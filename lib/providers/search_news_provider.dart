import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hacker_news/extras/helper/http_service.dart';
import 'package:hacker_news/response/search_news/search_news_response.dart';

class SearchNewsProvider extends ChangeNotifier {
  final HttpService _httpService = HttpService();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  SearchNewsResponse _searchNewsResponse = SearchNewsResponse();

  SearchNewsResponse get searchNewsResponse => _searchNewsResponse;

  set searchNewsResponse(SearchNewsResponse value) {
    _searchNewsResponse = value;
    notifyListeners();
  }

  Future<void> fetchSearchedNews(String searchedQuery) async {
    try {
      Response response = await _httpService.getRequest(
        endPoint: "search?query=$searchedQuery",
      );

      if (response.statusCode == 200) {
        searchNewsResponse = SearchNewsResponse.fromJson(response.data);
      }

      _isLoading = false;
    } on Exception catch (e) {
      _isLoading = false;
      throw Exception(e);
    }

    notifyListeners();
  }
}
