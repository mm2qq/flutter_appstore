// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeListModel _$HomeListModelFromJson(Map<String, dynamic> json) {
  return HomeListModel(
      appId: json['appId'] as String,
      appName: json['appName'] as String,
      icon: json['icon'] as String,
      version: json['version'] as String,
      pubDate: json['pubDate'] as String,
      downloadLink: json['downloadLink'] as String,
      shareLink: json['shareLink'] as String,
      qrCode: json['qrCode'] as String,
      isFavorite: json['isFavorite'] as bool);
}

Map<String, dynamic> _$HomeListModelToJson(HomeListModel instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'appName': instance.appName,
      'icon': instance.icon,
      'version': instance.version,
      'pubDate': instance.pubDate,
      'downloadLink': instance.downloadLink,
      'shareLink': instance.shareLink,
      'qrCode': instance.qrCode,
      'isFavorite': instance.isFavorite
    };
