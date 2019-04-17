import 'package:rxdart/rxdart.dart';

import '../api/business_api.dart';
import '../models/history_list_result.dart';
import 'bloc_provider.dart';

class AppHistoryBloc extends BlocBase {
  AppHistoryBloc({
    this.appId,
  }) {
    reload();
  }

  final String appId;

  final _historyController = ReplaySubject<HistoryListResult>(maxSize: 1);

  get result => _historyController.stream;

  Future reload() async {
    final _result = await bizAPI.historyList(appId, null, null, null);
    _historyController.add(_result);
  }

  Future filter(String pubDate, String environment, String version) async {
    final _result =
        await bizAPI.historyList(appId, pubDate, environment, version);
    _historyController.add(_result);
  }

  @override
  void dispose() {
    _historyController.close();
  }
}
