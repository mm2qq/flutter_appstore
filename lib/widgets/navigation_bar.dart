import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeNavigationBar extends CupertinoSliverNavigationBar {
  HomeNavigationBar({
    Key key,
    this.name,
    this.avatar,
    this.onTapped,
    @required this.title,
  }) : super(key: key);

  final String name;

  final String avatar;

  final String title;

  final VoidCallback onTapped;

  @override
  Widget get largeTitle => Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              inherit: false,
              fontSize: 34.0,
              color: CupertinoColors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 12.0,
            ),
            child: GestureDetector(
              child: ClipOval(
                child: FadeInImage.assetNetwork(
                  placeholder: 'images/account.png',
                  image: avatar,
                  width: 44.0,
                  height: 44.0,
                ),
              ),
              onTap: onTapped,
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      );

  @override
  Widget get trailing => name == null
      ? super.trailing
      : GestureDetector(
          child: Text(
            name,
            style: TextStyle(
              inherit: false,
              fontSize: 12.0,
              color: CupertinoColors.black,
            ),
          ),
          onTap: onTapped,
        );
}

class HistoryNavigationBar extends CupertinoNavigationBar {
  HistoryNavigationBar({
    Key key,
    this.onTapDate,
    this.onTapStar,
    @required this.title,
    @required this.dateChecked,
    @required this.isFavorite,
  }) : super(key: key);

  final String title;

  final bool dateChecked;

  final bool isFavorite;

  final VoidCallback onTapDate;

  final VoidCallback onTapStar;

  @override
  Widget get middle => Text(
        title,
        style: TextStyle(
          inherit: false,
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
          color: CupertinoColors.black,
        ),
      );

  @override
  Widget get trailing => Container(
        constraints: BoxConstraints.expand(
          width: 55.0,
          height: 22.0,
        ),
        child: Row(
          children: <Widget>[
            GestureDetector(
              child: Icon(
                Icons.today,
                size: 22.0,
                color: dateChecked
                    ? CupertinoColors.activeOrange
                    : CupertinoColors.activeBlue,
              ),
              onTap: onTapDate,
            ),
            GestureDetector(
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                size: 22.0,
                color: isFavorite
                    ? CupertinoColors.destructiveRed
                    : CupertinoColors.activeBlue,
              ),
              onTap: onTapStar,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      );

  @override
  bool get fullObstruction => true;
}

class DetailsNavigationBar extends CupertinoNavigationBar {
  DetailsNavigationBar({
    Key key,
    this.onTapShare,
    @required this.title,
  }) : super(key: key);

  final String title;

  final VoidCallback onTapShare;

  @override
  Widget get middle => Text(
        title,
        style: TextStyle(
          inherit: false,
          fontSize: 17.0,
          fontWeight: FontWeight.w600,
          color: CupertinoColors.black,
        ),
      );

  @override
  Widget get trailing => GestureDetector(
        child: Icon(
          CupertinoIcons.share,
          color: CupertinoColors.activeBlue,
        ),
        onTap: onTapShare,
      );

  @override
  bool get fullObstruction => true;
}
