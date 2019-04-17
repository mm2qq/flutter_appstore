import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../models/app_details_model.dart';
import '../models/history_list_model.dart';
import '../models/history_list_result.dart';
import '../models/home_list_result.dart';
import '../models/user.dart';

class BusinessAPI {
  static const String host = '127.0.0.1';

  static const String path = '/~maochaolong041';

  final _httpClient = HttpClient();

  /// 获取用户数据
  ///
  /// [userId] 用户ID
  Future<User> user(String userId) async {
    final _uri = Uri.http(
      host,
      '$path/users/$userId',
    );
    final _response = await _getRequest(_uri);
    final _model = User.fromJson(json.decode(_response));

    return _model;
  }

  /// 获取首页数据列表
  Future<HomeListResult> homeList() async {
    final _uri = Uri.http(
      host,
      '$path/home',
    );
    final _response = await _getRequest(_uri);
    final _result = HomeListResult.fromJson(json.decode(_response));

    return _result;
  }

  /// 获取App历史版本列表
  ///
  /// [appId] 应用ID
  /// [pubDate] 打包时间
  /// [environment] 环境
  /// [version] 版本号
  Future<HistoryListResult> historyList(
      String appId, String pubDate, String environment, String version) async {
    final _uri = Uri.http(
      host,
      '$path/apps/$appId',
      {
        'pubDate': pubDate,
        'environment': environment,
        'version': version,
      },
    );
    final _response = await _getRequest(_uri);
    final _result = HistoryListResult.fromJson(json.decode(_response));

    // TODO: 以下代码实现了客户端模拟服务器的数据筛选, 应该及时删除

    final _dateFilter = (HistoryListModel bundle) {
      return pubDate != null && pubDate.isNotEmpty
          ? bundle.pubDate == pubDate
          : true;
    };
    final _environmentFilter = (HistoryListModel bundle) {
      return environment != null && environment.isNotEmpty
          ? bundle.environment == environment
          : true;
    };
    final _versionFilter = (HistoryListModel bundle) {
      return version != null && version.isNotEmpty
          ? bundle.version == version
          : true;
    };

    _result.bundles = _result.bundles
        .where(_dateFilter)
        .where(_environmentFilter)
        .where(_versionFilter)
        .toList();

    return _result;
  }

  /// 获取App详情
  ///
  /// [appId] 应用ID
  /// [commitId] 提交ID
  Future<AppDetailsModel> appDetails(String appId, String commitId) async {
    final _uri = Uri.http(
      host,
      '$path/commits/$appId/$commitId',
    );
    final _response = await _getRequest(_uri);
    final _model = AppDetailsModel.fromJson(json.decode(_response));

    return _model;
  }

  Future<String> _getRequest(Uri uri) async {
    final _request = await _httpClient.getUrl(uri);
    final _response = await _request.close();

    return _response.transform(utf8.decoder).join();
  }
}

BusinessAPI bizAPI = BusinessAPI();
