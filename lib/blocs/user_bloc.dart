import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/business_api.dart';
import '../models/user.dart';
import 'bloc_provider.dart';

class UserBloc extends BlocBase {
  UserBloc() {
    reload();
  }

  static const String userIdKey = 'kUserIdKey';

  final _loginController = ReplaySubject<bool>(maxSize: 1);

  final _userController = ReplaySubject<User>(maxSize: 1);

  get isLogin => _loginController.stream;

  get user => _userController.stream;

  Future<bool> login(String userId) async {
    if (userId.isEmpty) {
      return false;
    }

    final _preferences = await SharedPreferences.getInstance();

    var _list = _preferences.getStringList(userIdKey);

    if (_list == null) {
      _list = [];
    }

    final contains = _list.contains(userId);

    if (!contains) {
      _list.add(userId);
    }

    final _success = await _preferences.setStringList(userIdKey, _list);

    if (_success) {
      reload();
    }

    return _success;
  }

  Future<bool> logout(String userId) async {
    if (userId.isEmpty) {
      return false;
    }

    final _preferences = await SharedPreferences.getInstance();

    var _list = _preferences.getStringList(userIdKey);

    if (_list == null) {
      _list = [];
    }

    final contains = _list.contains(userId);

    if (contains) {
      _list.remove(userId);
    }

    final _success = await _preferences.setStringList(userIdKey, _list);

    if (_success) {
      reload();
    }

    return _success;
  }

  Future reload() async {
    final _preferences = await SharedPreferences.getInstance();
    final _list = _preferences.getStringList(userIdKey);
    final _isLogin =
        _list == null || _list.isEmpty || _list.first.isEmpty ? false : true;

    _loginController.add(_isLogin);

    if (_isLogin) {
      bizAPI.user(_list.first).then((User user) {
        _userController.add(user);
      });
    } else {
      _userController.add(null);
    }
  }

  @override
  void dispose() {
    _loginController.close();
    _userController.close();
  }
}
