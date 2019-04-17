import 'package:json_annotation/json_annotation.dart';

import 'home_list_model.dart';

part 'home_list_result.g.dart';

@JsonSerializable()
class HomeListResult {
  HomeListResult({
    this.apps,
    this.favorites,
  });

  final List<HomeListModel> apps;

  final List<HomeListModel> favorites;

  factory HomeListResult.fromJson(Map<String, dynamic> json) =>
      _$HomeListResultFromJson(json);

  Map<String, dynamic> toJson() => _$HomeListResultToJson(this);
}
