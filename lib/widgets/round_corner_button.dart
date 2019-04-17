import 'package:flutter/cupertino.dart';

class RoundCornerButton extends StatelessWidget {
  RoundCornerButton({
    Key key,
    this.maxWidth,
    this.maxHeight,
    this.color,
    this.disabledColor,
    this.titleStyle,
    @required this.title,
    @required this.onTapped,
  }) : super(key: key);

  final double maxWidth;

  final double maxHeight;

  final Color color;

  final Color disabledColor;

  final String title;

  final TextStyle titleStyle;

  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    final _height = maxHeight == null ? 44.0 : maxHeight;

    return Container(
      constraints: BoxConstraints.expand(
        width: maxWidth,
        height: _height,
      ),
      child: CupertinoButton(
        child: Text(
          title,
          style: titleStyle == null
              ? TextStyle(
                  inherit: false,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                )
              : titleStyle,
        ),
        color: color == null ? CupertinoColors.activeBlue : color,
        disabledColor: disabledColor == null
            ? CupertinoColors.inactiveGray
            : disabledColor,
        padding: EdgeInsets.all(0.0),
        borderRadius: BorderRadius.circular(_height / 2),
        onPressed: onTapped,
      ),
    );
  }
}
