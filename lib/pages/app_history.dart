import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../blocs/app_history_bloc.dart';
import '../models/history_list_model.dart';
import '../routes/router.dart';
import '../routes/routes.dart';
import '../widgets/action_sheet_wrapper.dart';
import '../widgets/filter_widget.dart';
import '../widgets/history_list_item.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/sliver_persistent_header_delegate.dart';

class AppHistoryPage extends StatefulWidget {
  AppHistoryPage({
    Key key,
    @required this.appId,
    @required this.title,
    @required this.isFavorite,
  }) : super(key: key);

  final String appId;

  final String title;

  final bool isFavorite;

  @override
  _AppHistoryPageState createState() =>
      _AppHistoryPageState(bloc: AppHistoryBloc(appId: appId));
}

class _AppHistoryPageState extends State<AppHistoryPage>
    with SingleTickerProviderStateMixin {
  _AppHistoryPageState({
    this.bloc,
  });

  final AppHistoryBloc bloc;

  List<HistoryListModel> _bundles;

  bool _dateChecked;

  bool _isFavorite;

  DateTime _currentDate;

  DateTime _confirmDate;

  String _environment;

  String _version;

  get _pubDate => _confirmDate == null
      ? null
      : '${_confirmDate.year}/${_confirmDate.month}/${_confirmDate.day}';

  @override
  void initState() {
    final _currentTime = DateTime.now();
    _dateChecked = false;
    _isFavorite = widget.isFavorite;
    _currentDate = DateTime(
      _currentTime.year,
      _currentTime.month,
      _currentTime.day,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    bloc.result.listen((result) {
      setState(() {
        _bundles = result == null ? null : result.bundles;
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
      navigationBar: HistoryNavigationBar(
        title: widget.title,
        dateChecked: _dateChecked,
        isFavorite: _isFavorite,
        onTapDate: () {
          _handleTapDate(context);
        },
        onTapStar: _handleTapStar,
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverRefreshControl(
            onRefresh: () {
              bloc.reload();
            },
          ),
          SliverPersistentHeader(
            delegate: MySliverPersistentHeaderDelegate(
              child: FilterWidget(
                bloc: bloc,
                onTapEnvironment: _handleTapEnvironmentConfirm,
                onTapVersion: _handleTapVersionConfirm,
              ),
              height: 40.0,
            ),
            pinned: true,
          ),
          SliverSafeArea(
            top: false,
            sliver: _bundles == null
                ? SliverFillRemaining(
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final _model = _bundles[index];

                        return HistoryListItem(
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
                      childCount: _bundles.length,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void _handleTapDate(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return ActionSheetWrapper(
          child: CupertinoDatePicker(
            initialDateTime: _confirmDate,
            mode: CupertinoDatePickerMode.date,
            use24hFormat: true,
            onDateTimeChanged: (dateTime) {
              _currentDate = dateTime;
            },
          ),
          onConfirmed: _handleTapDateConfirm,
        );
      },
    );
  }

  void _handleTapDateConfirm() {
    setState(() {
      _dateChecked = true;
      _confirmDate = _currentDate;
      bloc.filter(_pubDate, _environment, _version);
    });
  }

  void _handleTapEnvironmentConfirm(String environment) {
    setState(() {
      _environment = environment;
      bloc.filter(_pubDate, _environment, _version);
    });
  }

  void _handleTapVersionConfirm(String version) {
    setState(() {
      _version = version;
      bloc.filter(_pubDate, _environment, _version);
    });
  }

  void _handleTapStar() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  void _handleTapApp(BuildContext context, HistoryListModel model) {
    Navigator.push(context, CupertinoPageRoute(
      builder: (context) {
        return Router.widget(
          DETAILS_ROUTE,
          context,
          params: {
            'appId': model.appId,
            'commitId': model.commitId,
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
