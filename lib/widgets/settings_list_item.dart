import 'package:flutter/cupertino.dart';

class SettingsListItem extends StatelessWidget {
  SettingsListItem({
    Key key,
    this.maxHeight,
    @required this.title,
    @required this.onTapped,
  }) : super(key: key);

  final double maxHeight;

  final String title;

  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(
          left: 15.0,
          right: 13.0,
        ),
        child: Row(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                inherit: false,
                fontSize: 15.0,
                color: Color(0xFF333333),
              ),
            ),
            Icon(
              CupertinoIcons.forward,
              color: Color(0xFFDDDDDD),
              size: 22.0,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        height: maxHeight == null ? 44.0 : maxHeight,
        color: CupertinoColors.white,
      ),
      onTap: onTapped,
    );
  }
}
