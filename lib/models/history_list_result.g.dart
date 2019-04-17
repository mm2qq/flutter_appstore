// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_list_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryListResult _$HistoryListResultFromJson(Map<String, dynamic> json) {
  return HistoryListResult(
      bundles: (json['bundles'] as List)
          ?.map((e) => e == null
              ? null
              : HistoryListModel.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      environments:
          (json['environments'] as List)?.map((e) => e as String)?.toList(),
      versions: (json['versions'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$HistoryListResultToJson(HistoryListResult instance) =>
    <String, dynamic>{
      'bundles': instance.bundles,
      'environments': instance.environments,
      'versions': instance.versions
    };
