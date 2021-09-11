import 'package:json_annotation/json_annotation.dart';

part 'hits.g.dart';

@JsonSerializable()
class Hits {
  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "author")
  String? author;

  @JsonKey(name: "objectID")
  String? objectID;

  Hits();

  factory Hits.fromJson(Map<String, dynamic> json) => _$HitsFromJson(json);
  Map<String, dynamic> toJson() => _$HitsToJson(this);
}
