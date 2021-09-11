// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchNewsResponse _$SearchNewsResponseFromJson(Map<String, dynamic> json) =>
    SearchNewsResponse()
      ..hitsList = (json['hits'] as List<dynamic>?)
          ?.map((e) => Hits.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SearchNewsResponseToJson(SearchNewsResponse instance) =>
    <String, dynamic>{
      'hits': instance.hitsList,
    };
