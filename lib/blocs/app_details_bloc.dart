import 'package:rxdart/rxdart.dart';

import '../api/business_api.dart';
import '../models/app_details_model.dart';
import 'bloc_provider.dart';

class AppDetailsBloc extends BlocBase {
  AppDetailsBloc({
    this.appId,
    this.commitId,
  }) {
    reload();
  }

  final String appId;

  final String commitId;

  final _detailsController = ReplaySubject<AppDetailsModel>(maxSize: 1);

  get model => _detailsController.stream;

  Future reload() async {
    final _model = await bizAPI.appDetails(appId, commitId);
    _detailsController.add(_model);
  }

  @override
  void dispose() {
    _detailsController.close();
  }
}
