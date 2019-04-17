import 'package:json_annotation/json_annotation.dart';

part 'app_details_model.g.dart';

@JsonSerializable()
class AppDetailsModel {
  AppDetailsModel(
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
    this.bundleId,
    this.changeLog,
    this.systemVersion,
    this.packageSize,
    this.branch,
  );

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
  final String bundleId;
  final String changeLog;
  final String systemVersion;
  final String packageSize;
  final String branch;

  factory AppDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AppDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppDetailsModelToJson(this);
}
