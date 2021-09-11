import 'package:json_annotation/json_annotation.dart';

import 'comments.dart';

part 'news_details_response.g.dart';

@JsonSerializable()
class NewsDetailsResponse {
  NewsDetailsResponse();

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "points")
  int? points;

  @JsonKey(name: "children")
  List<Comments>? commentsList;

  factory NewsDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NewsDetailsResponseToJson(this);
}
