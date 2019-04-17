import 'package:flutter/cupertino.dart';

class UserPage extends StatelessWidget {
  UserPage({
    Key key,
    @required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          '用户信息',
          style: TextStyle(
            inherit: false,
            fontSize: 17.0,
            fontWeight: FontWeight.w600,
            color: CupertinoColors.black,
          ),
        ),
      ),
      child: Center(
        child: Text('我是用户页'),
      ),
    );
  }
}
