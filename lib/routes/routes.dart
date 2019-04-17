import 'package:flutter/widgets.dart';

import '../pages/app_details.dart';
import '../pages/app_history.dart';
import '../pages/feedback.dart';
import '../pages/home.dart';
import '../pages/login.dart';
import '../pages/settings.dart';
import '../pages/user.dart';
import 'router.dart';

const String LOGIN_ROUTE = '/login';
const String SETTINGS_ROUTE = '/settings';
const String USER_ROUTE = '/users/{userId}';
const String FEEDBACK_ROUTE = '/feedback';
const String HOME_ROUTE = '/home';
const String HISTORY_ROUTE = '/apps/{appId}';
const String DETAILS_ROUTE = '/commits/{appId}/{commitId}';

class Routes {
  static configRoutes() {
    Router.register(LOGIN_ROUTE, (BuildContext context, {Map params}) {
      return LoginPage();
    });

    Router.register(SETTINGS_ROUTE, (BuildContext context, {Map params}) {
      return SettingsPage();
    });

    Router.register(USER_ROUTE, (BuildContext context, {Map params}) {
      return UserPage(
        userId: params == null ? null : params['userId'],
      );
    });

    Router.register(FEEDBACK_ROUTE, (BuildContext context, {Map params}) {
      return FeedbackPage();
    });

    Router.register(HOME_ROUTE, (BuildContext context, {Map params}) {
      return HomePage();
    });

    Router.register(HISTORY_ROUTE, (BuildContext context, {Map params}) {
      return AppHistoryPage(
        appId: params == null ? null : params['appId'],
        title: params == null ? null : params['appName'],
        isFavorite: params == null ? null : params['isFavorite'],
      );
    });

    Router.register(DETAILS_ROUTE, (BuildContext context, {Map params}) {
      return AppDetailsPage(
        appId: params == null ? null : params['appId'],
        commitId: params == null ? null : params['commitId'],
      );
    });
  }
}
