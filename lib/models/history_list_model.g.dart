// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryListModel _$HistoryListModelFromJson(Map<String, dynamic> json) {
  return HistoryListModel(
      appId: json['appId'] as String,
      appName: json['appName'] as String,
      icon: json['icon'] as String,
      version: json['version'] as String,
      environment: json['environment'] as String,
      pubDate: json['pubDate'] as String,
      downloadLink: json['downloadLink'] as String,
      shareLink: json['shareLink'] as String,
      qrCode: json['qrCode'] as String,
      isFavorite: json['isFavorite'] as bool,
      build: json['build'] as String,
      committer: json['committer'] as String,
      commitId: json['commitId'] as String);
}

Map<String, dynamic> _$HistoryListModelToJson(HistoryListModel instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'appName': instance.appName,
      'icon': instance.icon,
      'version': instance.version,
      'environment': instance.environment,
      'pubDate': instance.pubDate,
      'downloadLink': instance.downloadLink,
      'shareLink': instance.shareLink,
      'qrCode': instance.qrCode,
      'isFavorite': instance.isFavorite,
      'build': instance.build,
      'committer': instance.committer,
      'commitId': instance.commitId
    };
