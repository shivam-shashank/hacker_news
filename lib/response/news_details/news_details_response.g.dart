// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDetailsResponse _$NewsDetailsResponseFromJson(Map<String, dynamic> json) =>
    NewsDetailsResponse()
      ..title = json['title'] as String?
      ..points = json['points'] as int?
      ..commentsList = (json['children'] as List<dynamic>?)
          ?.map((e) => Comments.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$NewsDetailsResponseToJson(
        NewsDetailsResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'points': instance.points,
      'children': instance.commentsList,
    };
