import 'package:flutter/widgets.dart';

class DetailsCardItem extends StatelessWidget {
  DetailsCardItem({
    Key key,
    this.maxHeight,
    this.hideBottom,
    @required this.title,
    @required this.content,
  }) : super(key: key);

  final double maxHeight;

  final bool hideBottom;

  final String title;

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 6.0,
      ),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              inherit: false,
              fontSize: 13.0,
              color: Color(0xFF666666),
            ),
          ),
          Text(
            content,
            style: TextStyle(
              inherit: false,
              fontSize: 15.0,
              color: Color(0xFF333333),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      constraints: BoxConstraints.expand(
        width: double.infinity,
        height: maxHeight == null ? 53.0 : maxHeight,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: hideBottom == null || hideBottom == false
                ? Color(0xFFDDDDDD)
                : Color(0xFFFFFFFF),
            width: 0.0,
          ),
        ),
      ),
    );
  }
}
