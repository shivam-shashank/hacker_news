import 'package:hacker_news/response/search_news/hits.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_news_response.g.dart';

@JsonSerializable()
class SearchNewsResponse {
  SearchNewsResponse();

  @JsonKey(name: "hits")
  List<Hits>? hitsList;

  factory SearchNewsResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchNewsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchNewsResponseToJson(this);
}
