import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc_provider.dart';
import '../blocs/user_bloc.dart';
import '../models/user.dart';
import '../routes/router.dart';
import '../routes/routes.dart';
import '../widgets/round_corner_button.dart';
import '../widgets/settings_list_item.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with SingleTickerProviderStateMixin {
  get _userBloc => BlocProvider.of<UserBloc>(context).first;

  User _user;

  @override
  void didChangeDependencies() {
    _userBloc.user.listen((user) {
      setState(() {
        _user = user;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          '设置',
          style: TextStyle(
            inherit: false,
            fontSize: 17.0,
            fontWeight: FontWeight.w600,
            color: CupertinoColors.black,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) => index == 2
              ? Padding(
                  padding: EdgeInsets.fromLTRB(
                    15.0,
                    43.0,
                    15.0,
                    0.0,
                  ),
                  child: RoundCornerButton(
                    title: '退出',
                    onTapped: () {
                      _handleTapExit(context);
                    },
                  ),
                )
              : SettingsListItem(
                  title: index == 0 ? '用户信息' : '意见反馈',
                  onTapped: () {
                    _handleTap(context, index);
                  },
                ),
          separatorBuilder: (BuildContext context, int index) => Divider(
                height: 0.5,
                indent: 15.0,
                color: Color(0xFFDDDDDD),
              ),
          itemCount: 3,
        ),
      ),
    );
  }

  void _handleTap(BuildContext context, int index) {
    Navigator.push(context, CupertinoPageRoute(
      builder: (context) {
        return Router.widget(
          index == 0 ? USER_ROUTE : FEEDBACK_ROUTE,
          context,
        );
      },
    ));
  }

  void _handleTapExit(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        final _cancelAction = CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            '取消',
          ),
        );

        final _confirmAction = CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () {
            Navigator.of(context).pop();

            if (_user != null && _user.userId.isNotEmpty) {
              _userBloc.logout(_user.userId).then(
                (success) {
                  if (success) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                        builder: (context) {
                          return Router.widget(
                            LOGIN_ROUTE,
                            context,
                          );
                        },
                      ),
                      (Route<dynamic> route) {
                        return false;
                      },
                    );
                  }
                },
              );
            }
          },
          child: Text(
            '确认',
          ),
        );

        return CupertinoAlertDialog(
          title: Text(
            '提示',
          ),
          content: Text(
            '点击确认退出当前账号',
          ),
          actions: [
            _cancelAction,
            _confirmAction,
          ],
        );
      },
    );
  }
}
