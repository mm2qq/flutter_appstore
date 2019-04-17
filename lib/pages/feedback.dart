import 'package:flutter/cupertino.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          '意见反馈',
          style: TextStyle(
            inherit: false,
            fontSize: 17.0,
            fontWeight: FontWeight.w600,
            color: CupertinoColors.black,
          ),
        ),
      ),
      child: Center(
        child: Text('我是反馈页'),
      ),
    );
  }
}
