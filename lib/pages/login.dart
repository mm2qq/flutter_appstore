import 'package:flutter/cupertino.dart';

import '../blocs/bloc_provider.dart';
import '../blocs/user_bloc.dart';
import '../routes/router.dart';
import '../routes/routes.dart';
import '../widgets/blank_widget.dart';
import '../widgets/round_corner_button.dart';
import '../widgets/text_field.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _scopeNode = FocusScopeNode();
    final _accountNode = FocusNode();
    final _passwordNode = FocusNode();
    final _verifyNode = FocusNode();

    return CupertinoPageScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15.0, 90.0, 15.0, 43.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'images/logo.png',
                ),
              ),
              BlankWidget(
                maxHeight: 86.0,
              ),
              MyTextField(
                image: Image.asset(
                  'images/account.png',
                ),
                placeholder: '请输入UM账号',
                scopeNode: _scopeNode,
                currentNode: _accountNode,
                nextNode: _passwordNode,
                onSubmitted: (value) {},
              ),
              BlankWidget(
                maxHeight: 19.0,
              ),
              MyTextField(
                image: Image.asset(
                  'images/password.png',
                  width: 25.0,
                ),
                placeholder: '请输入密码',
                scopeNode: _scopeNode,
                currentNode: _passwordNode,
                nextNode: _verifyNode,
                obscureText: true,
                onSubmitted: (value) {},
              ),
              BlankWidget(
                maxHeight: 19.0,
              ),
              MyTextField(
                placeholder: '请输入验证码',
                scopeNode: _scopeNode,
                currentNode: _verifyNode,
                inputAction: TextInputAction.done,
                onSubmitted: (value) {},
              ),
              BlankWidget(
                maxHeight: 43.0,
              ),
              RoundCornerButton(
                title: '登录',
                onTapped: () {
                  if (_accountNode.hasFocus) {
                    _accountNode.unfocus();
                  }
                  if (_passwordNode.hasFocus) {
                    _passwordNode.unfocus();
                  }
                  if (_verifyNode.hasFocus) {
                    _verifyNode.unfocus();
                  }
                  _handleLogin(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    final _userBloc = BlocProvider.of<UserBloc>(context).first;

    _userBloc.login('920128').then(
      (success) {
        if (success) {
          Navigator.pushReplacement(context, CupertinoPageRoute(
            builder: (context) {
              return Router.widget(
                HOME_ROUTE,
                context,
              );
            },
          ));
        }
      },
    );
  }
}
