import 'package:rxdart/rxdart.dart';

import '../api/business_api.dart';
import '../models/home_list_result.dart';
import 'bloc_provider.dart';

class HomeBloc extends BlocBase {
  HomeBloc() {
    reload();
  }

  final _homeController = ReplaySubject<HomeListResult>(maxSize: 1);

  get result => _homeController.stream;

  Future reload() async {
    final _result = await bizAPI.homeList();
    _homeController.add(_result);
  }

  @override
  void dispose() {
    _homeController.close();
  }
}
