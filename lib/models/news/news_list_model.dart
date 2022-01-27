import 'package:json_annotation/json_annotation.dart';

import 'results.dart';

part 'news_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsListModel {
  String? status;
  String? copyright;
  int? numResults;
  List<Results>? results;

  NewsListModel({this.status, this.copyright, this.numResults, this.results});

  factory NewsListModel.fromJson(Map<String, dynamic> json) =>
      _$NewsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsListModelToJson(this);
}
