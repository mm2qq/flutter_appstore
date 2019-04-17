import 'package:flutter/cupertino.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/history_list_model.dart';
import 'round_corner_button.dart';

class HistoryListItem extends StatelessWidget {
  HistoryListItem({
    Key key,
    this.maxHeight,
    @required this.model,
    @required this.onTapped,
    @required this.onInstalled,
    @required this.onShared,
  }) : super(key: key);

  final double maxHeight;

  final HistoryListModel model;

  final VoidCallback onTapped;

  final ValueChanged<String> onInstalled;

  final ValueChanged<String> onShared;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(
          15.0,
          13.0,
          4.0,
          13.0,
        ),
        child: Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: model.icon,
                    width: 60.0,
                    height: 60.0,
                  ),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '版本号: ${model.version}',
                        style: TextStyle(
                          inherit: false,
                          fontSize: 12.0,
                          color: CupertinoColors.black,
                        ),
                      ),
                      Text(
                        '构建号: ${model.build}',
                        style: TextStyle(
                          inherit: false,
                          fontSize: 12.0,
                          color: CupertinoColors.black,
                        ),
                      ),
                      Text(
                        '打包人: ${model.committer}',
                        style: TextStyle(
                          inherit: false,
                          fontSize: 12.0,
                          color: CupertinoColors.black,
                        ),
                      ),
                      Text(
                        '打包时间: ${model.pubDate}',
                        style: TextStyle(
                          inherit: false,
                          fontSize: 12.0,
                          color: CupertinoColors.black,
                        ),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    RoundCornerButton(
                      title: '安装',
                      maxWidth: 54.0,
                      maxHeight: 24.0,
                      color: CupertinoColors.lightBackgroundGray,
                      titleStyle: TextStyle(
                        inherit: false,
                        fontSize: 10.0,
                        color: Color(0xFF4A90E2),
                      ),
                      onTapped: () {
                        onInstalled(model.downloadLink);
                      },
                    ),
                    RoundCornerButton(
                      title: '分享',
                      maxWidth: 54.0,
                      maxHeight: 24.0,
                      color: CupertinoColors.lightBackgroundGray,
                      titleStyle: TextStyle(
                        inherit: false,
                        fontSize: 10.0,
                        color: Color(0xFF4A90E2),
                      ),
                      onTapped: () {
                        onShared(model.shareLink);
                      },
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
                Icon(
                  CupertinoIcons.forward,
                  color: Color(0xFFDDDDDD),
                  size: 22.0,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFDDDDDD),
              width: 0.0,
            ),
          ),
          color: CupertinoColors.white,
        ),
        height: maxHeight == null ? 98.0 : maxHeight,
      ),
      onTap: onTapped,
    );
  }
}
