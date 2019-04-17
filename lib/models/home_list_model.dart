import 'package:json_annotation/json_annotation.dart';

part 'home_list_model.g.dart';

@JsonSerializable()
class HomeListModel {
  HomeListModel({
    this.appId,
    this.appName,
    this.icon,
    this.version,
    this.pubDate,
    this.downloadLink,
    this.shareLink,
    this.qrCode,
    this.isFavorite,
  });

  final String appId;
  final String appName;
  final String icon;
  final String version;
  final String pubDate;
  final String downloadLink;
  final String shareLink;
  final String qrCode;
  final bool isFavorite;

  factory HomeListModel.fromJson(Map<String, dynamic> json) =>
      _$HomeListModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeListModelToJson(this);
}
