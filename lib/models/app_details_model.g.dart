// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppDetailsModel _$AppDetailsModelFromJson(Map<String, dynamic> json) {
  return AppDetailsModel(
      json['appId'] as String,
      json['appName'] as String,
      json['icon'] as String,
      json['version'] as String,
      json['environment'] as String,
      json['pubDate'] as String,
      json['downloadLink'] as String,
      json['shareLink'] as String,
      json['qrCode'] as String,
      json['isFavorite'] as bool,
      json['build'] as String,
      json['committer'] as String,
      json['commitId'] as String,
      json['bundleId'] as String,
      json['changeLog'] as String,
      json['systemVersion'] as String,
      json['packageSize'] as String,
      json['branch'] as String);
}

Map<String, dynamic> _$AppDetailsModelToJson(AppDetailsModel instance) =>
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
      'commitId': instance.commitId,
      'bundleId': instance.bundleId,
      'changeLog': instance.changeLog,
      'systemVersion': instance.systemVersion,
      'packageSize': instance.packageSize,
      'branch': instance.branch
    };
