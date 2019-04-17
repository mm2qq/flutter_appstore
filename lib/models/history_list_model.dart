import 'package:json_annotation/json_annotation.dart';

part 'history_list_model.g.dart';

@JsonSerializable()
class HistoryListModel {
  HistoryListModel({
    this.appId,
    this.appName,
    this.icon,
    this.version,
    this.environment,
    this.pubDate,
    this.downloadLink,
    this.shareLink,
    this.qrCode,
    this.isFavorite,
    this.build,
    this.committer,
    this.commitId,
  });

  final String appId;
  final String appName;
  final String icon;
  final String version;
  final String environment;
  final String pubDate;
  final String downloadLink;
  final String shareLink;
  final String qrCode;
  final bool isFavorite;
  final String build;
  final String committer;
  final String commitId;

  factory HistoryListModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryListModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryListModelToJson(this);
}
