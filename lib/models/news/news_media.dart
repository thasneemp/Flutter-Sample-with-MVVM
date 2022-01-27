
import 'package:json_annotation/json_annotation.dart';

import 'media_meta_data.dart';
part 'news_media.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsMedia {
  String? type;
  String? subtype;
  String? caption;
  String? copyright;
  int? approvedForSyndication;
  @JsonKey(name: "media-metadata")
  List<MediaMetadata>? mediaMetadata;

  NewsMedia(
      {this.type,
      this.subtype,
      this.caption,
      this.copyright,
      this.approvedForSyndication,
      this.mediaMetadata});

  factory NewsMedia.fromJson(Map<String, dynamic> json) => _$NewsMediaFromJson(json);

  Map<String, dynamic> toJson() => _$NewsMediaToJson(this);
}
