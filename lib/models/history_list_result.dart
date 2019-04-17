import 'package:json_annotation/json_annotation.dart';

import 'history_list_model.dart';

part 'history_list_result.g.dart';

@JsonSerializable()
class HistoryListResult {
  HistoryListResult({
    this.bundles,
    this.environments,
    this.versions,
  });

  List<HistoryListModel> bundles;

  final List<String> environments;

  final List<String> versions;

  factory HistoryListResult.fromJson(Map<String, dynamic> json) =>
      _$HistoryListResultFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryListResultToJson(this);
}
