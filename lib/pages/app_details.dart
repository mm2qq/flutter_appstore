import 'package:flutter/cupertino.dart';

import '../blocs/app_details_bloc.dart';
import '../models/app_details_model.dart';
import '../widgets/details_card.dart';
import '../widgets/details_header.dart';
import '../widgets/navigation_bar.dart';

class AppDetailsPage extends StatefulWidget {
  AppDetailsPage({
    Key key,
    @required this.appId,
    @required this.commitId,
  }) : super(key: key);

  final String appId;

  final String commitId;

  @override
  _AppDetailsPageState createState() => _AppDetailsPageState(
      bloc: AppDetailsBloc(appId: appId, commitId: commitId));
}

class _AppDetailsPageState extends State<AppDetailsPage>
    with SingleTickerProviderStateMixin {
  _AppDetailsPageState({
    this.bloc,
  });

  final AppDetailsBloc bloc;

  int _changeLogLines;

  AppDetailsModel _detailsModel;

  @override
  void initState() {
    _changeLogLines = 5;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    bloc.model.listen((model) {
      setState(() {
        _detailsModel = model;
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
      navigationBar: DetailsNavigationBar(
        title: '详细信息',
        onTapShare: () {
          if (_detailsModel != null) {
            _handleTapShare(context, _detailsModel.shareLink);
          }
        },
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverRefreshControl(
            onRefresh: () {
              bloc.reload();
            },
          ),
          SliverSafeArea(
            top: false,
            sliver: _detailsModel == null
                ? SliverFillRemaining(
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  )
                : SliverPadding(
                    padding: EdgeInsets.only(
                      left: 15.0,
                      bottom: 43.0,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          var _widget;

                          switch (index) {
                            case 0:
                              _widget = DetailsHeader(
                                model: _detailsModel,
                                onInstalled: (link) {
                                  _handleTapInstall(context, link);
                                },
                              );
                              break;
                            case 1:
                              _widget = Padding(
                                padding: EdgeInsets.only(
                                  top: 14.0,
                                ),
                                child: Text(
                                  '更新日志',
                                  style: TextStyle(
                                    inherit: false,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              );
                              break;
                            case 2:
                              _widget = _buildChangeLog(
                                _detailsModel.changeLog,
                                TextStyle(
                                  inherit: false,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF8E8E93),
                                ),
                              );
                              break;
                            case 3:
                              _widget = Padding(
                                padding: EdgeInsets.only(
                                  top: 15.0,
                                  right: 15.0,
                                ),
                                child: DetailsCard(
                                  model: _detailsModel,
                                ),
                              );
                              break;
                          }

                          return _widget;
                        },
                        childCount: 4,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildChangeLog(String changeLog, TextStyle style) {
    return Padding(
      padding: EdgeInsets.only(
        top: 9.0,
        right: 9.0,
      ),
      child: changeLog == null || changeLog.isEmpty
          ? Text(
              '暂无数据',
              style: style,
            )
          : GestureDetector(
              child: Column(
                children: <Widget>[
                  Text(
                    changeLog,
                    style: style,
                    maxLines: _changeLogLines,
                    overflow: TextOverflow.fade,
                  ),
                  Text(
                    _changeLogLines == 5 ? '更多' : '',
                    style: TextStyle(
                      inherit: false,
                      fontSize: 13.0,
                      color: CupertinoColors.activeBlue,
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              onTap: () {
                if (_changeLogLines == 5) {
                  setState(() {
                    _changeLogLines = _changeLogLines == 5 ? 100 : 5;
                  });
                }
              },
            ),
    );
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
