// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_list_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeListResult _$HomeListResultFromJson(Map<String, dynamic> json) {
  return HomeListResult(
      apps: (json['apps'] as List)
          ?.map((e) => e == null
              ? null
              : HomeListModel.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      favorites: (json['favorites'] as List)
          ?.map((e) => e == null
              ? null
              : HomeListModel.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HomeListResultToJson(HomeListResult instance) =>
    <String, dynamic>{'apps': instance.apps, 'favorites': instance.favorites};
