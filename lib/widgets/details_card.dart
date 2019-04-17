import 'package:flip_card/flip_card.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/app_details_model.dart';
import 'details_card_item.dart';

class DetailsCard extends StatelessWidget {
  DetailsCard({
    Key key,
    this.maxHeight,
    @required this.model,
  }) : super(key: key);

  final double maxHeight;

  final AppDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        15.0,
      ),
      child: FlipCard(
        front: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '包信息',
                  style: TextStyle(
                    inherit: false,
                    fontSize: 19.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                Image.asset(
                  'images/qrcode.png',
                  width: 20.0,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            DetailsCardItem(
              title: '兼容性',
              content: model.systemVersion,
            ),
            DetailsCardItem(
              title: '打包人',
              content: model.committer,
            ),
            DetailsCardItem(
              title: '大小',
              content: model.packageSize,
            ),
            DetailsCardItem(
              title: '发布时间',
              content: model.pubDate,
            ),
            DetailsCardItem(
              title: '分支',
              content: model.branch,
            ),
            DetailsCardItem(
              title: '提交ID',
              content: model.commitId,
              hideBottom: true,
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        back: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '二维码',
                  style: TextStyle(
                    inherit: false,
                    fontSize: 19.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                Image.asset(
                  'images/info.png',
                  width: 20.0,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            model.qrCode == null || model.qrCode.isEmpty
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(
                      bottom: 34.0,
                    ),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: model.qrCode,
                      width: 240.0,
                      height: 240.0,
                    ),
                  ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
      constraints: BoxConstraints.expand(
        width: double.infinity,
        height: maxHeight == null ? 378.0 : maxHeight,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFF8F8F8),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(
          13.5,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(
              3.0,
              3.0,
            ),
            blurRadius: 3.0,
            color: Color(0xFFC7C7CC),
          ),
        ],
        color: Color(0xFFFFFFFF),
      ),
    );
  }
}
