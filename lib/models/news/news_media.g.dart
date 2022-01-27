// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsMedia _$NewsMediaFromJson(Map<String, dynamic> json) => NewsMedia(
      type: json['type'] as String?,
      subtype: json['subtype'] as String?,
      caption: json['caption'] as String?,
      copyright: json['copyright'] as String?,
      approvedForSyndication: json['approvedForSyndication'] as int?,
      mediaMetadata: (json['media-metadata'] as List<dynamic>?)
          ?.map((e) => MediaMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsMediaToJson(NewsMedia instance) => <String, dynamic>{
      'type': instance.type,
      'subtype': instance.subtype,
      'caption': instance.caption,
      'copyright': instance.copyright,
      'approvedForSyndication': instance.approvedForSyndication,
      'media-metadata': instance.mediaMetadata?.map((e) => e.toJson()).toList(),
    };
