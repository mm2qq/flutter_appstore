import 'package:flutter/cupertino.dart';

import '../blocs/bloc_provider.dart';
import '../blocs/home_bloc.dart';
import '../blocs/user_bloc.dart';
import '../models/home_list_model.dart';
import '../models/user.dart';
import '../routes/router.dart';
import '../routes/routes.dart';
import '../widgets/home_list_item.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/sliver_persistent_header_delegate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState(bloc: HomeBloc());
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  _HomePageState({
    this.bloc,
  });

  final HomeBloc bloc;

  get _userBloc => BlocProvider.of<UserBloc>(context).first;

  List<HomeListModel> _apps;

  List<HomeListModel> _favorites;

  User _user;

  @override
  void didChangeDependencies() {
    bloc.result.listen((result) {
      setState(() {
        _apps = result == null ? null : result.apps;
        _favorites = result == null ? null : result.favorites;
      });
    });
    _userBloc.user.listen((user) {
      setState(() {
        _user = user;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          HomeNavigationBar(
            title: 'Apps',
            name: _user == null ? '' : _user.userName,
            avatar: _user == null ? '' : _user.avatar,
            onTapped: () {
              if (_user != null && _user.userId.isNotEmpty) {
                _handleTapUser(context);
              }
            },
          ),
          CupertinoSliverRefreshControl(
            onRefresh: () {
              bloc.reload();
              _userBloc.reload();
            },
          ),
          _buildList(_apps, false),
          SliverSafeArea(
            top: false,
            bottom: false,
            sliver: SliverPersistentHeader(
              delegate: MySliverPersistentHeaderDelegate(
                child: Text(
                  'Favorites',
                  style: TextStyle(
                    inherit: false,
                    fontSize: 34.0,
                    color: CupertinoColors.black,
                  ),
                ),
                insets: EdgeInsets.only(
                  left: 12.0,
                  top: 6.0,
                ),
                height: 50.0,
              ),
            ),
          ),
          _buildList(_favorites, true),
        ],
      ),
    );
  }

  Widget _buildList(List<HomeListModel> models, bool bottomSafeArea) {
    return SliverSafeArea(
      top: false,
      bottom: bottomSafeArea,
      sliver: models == null
          ? SliverFillRemaining(
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            )
          : SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final _model = models[index];

                  return HomeListItem(
                    model: _model,
                    onTapped: () {
                      _handleTapApp(
                        context,
                        _model,
                      );
                    },
                    onInstalled: (link) {
                      _handleTapInstall(context, link);
                    },
                    onShared: (link) {
                      _handleTapShare(context, link);
                    },
                  );
                },
                childCount: models.length,
              ),
            ),
    );
  }

  void _handleTapUser(BuildContext context) {
    Navigator.push(context, CupertinoPageRoute(
      builder: (context) {
        return Router.widget(
          SETTINGS_ROUTE,
          context,
        );
      },
    ));
  }

  void _handleTapApp(BuildContext context, HomeListModel model) {
    Navigator.push(context, CupertinoPageRoute(
      builder: (context) {
        return Router.widget(
          HISTORY_ROUTE,
          context,
          params: {
            'appId': model.appId,
            'appName': model.appName,
            'isFavorite': model.isFavorite,
          },
        );
      },
    ));
  }

  void _handleTapInstall(BuildContext context, String link) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        final _confirmAction = CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            '确定',
          ),
        );

        return CupertinoAlertDialog(
          title: Text(
            '正在安装...',
          ),
          content: Text(
            link,
          ),
          actions: [_confirmAction],
        );
      },
    );
  }

  void _handleTapShare(BuildContext context, String link) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        final _confirmAction = CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            '确定',
          ),
        );

        return CupertinoAlertDialog(
          title: Text(
            '正在分享...',
          ),
          content: Text(
            link,
          ),
          actions: [_confirmAction],
        );
      },
    );
  }
}
