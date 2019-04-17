import 'package:flutter/cupertino.dart';

class ActionSheetWrapper extends StatelessWidget {
  ActionSheetWrapper({
    Key key,
    this.maxHeight,
    @required this.child,
    @required this.onConfirmed,
  }) : super(key: key);

  final double maxHeight;

  final Widget child;

  final VoidCallback onConfirmed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  CupertinoButton(
                    child: Text(
                      '取消',
                      style: TextStyle(
                        inherit: false,
                        fontSize: 17.0,
                      ),
                    ),
                    padding: EdgeInsets.all(0.0),
                    onPressed: () {
                      _handleTapCancel(context);
                    },
                  ),
                  CupertinoButton(
                    child: Text(
                      '确定',
                      style: TextStyle(
                        inherit: false,
                        fontSize: 17.0,
                      ),
                    ),
                    padding: EdgeInsets.all(0.0),
                    onPressed: () {
                      _handleTapConfirm(context);
                    },
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              color: Color(0xB7212121),
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
              height: 44.0,
            ),
            Container(
              child: child,
              height: maxHeight == null ? 200.0 : maxHeight - 44.0,
            ),
          ],
        ),
        constraints: BoxConstraints.expand(
          width: double.infinity,
          height: maxHeight == null ? 244.0 : maxHeight,
        ),
      ),
    );
  }

  void _handleTapCancel(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _handleTapConfirm(BuildContext context) {
    onConfirmed();
    _handleTapCancel(context);
  }
}
