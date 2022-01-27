// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsListModel _$NewsListModelFromJson(Map<String, dynamic> json) =>
    NewsListModel(
      status: json['status'] as String?,
      copyright: json['copyright'] as String?,
      numResults: json['numResults'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsListModelToJson(NewsListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'numResults': instance.numResults,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };
