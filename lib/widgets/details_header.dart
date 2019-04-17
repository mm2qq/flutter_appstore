import 'package:flutter/cupertino.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/app_details_model.dart';
import 'round_corner_button.dart';

class DetailsHeader extends StatelessWidget {
  DetailsHeader({
    Key key,
    this.maxHeight,
    @required this.model,
    @required this.onInstalled,
  }) : super(key: key);

  final double maxHeight;

  final AppDetailsModel model;

  final ValueChanged<String> onInstalled;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          ClipRRect(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: model.icon,
              width: 94.0,
              height: 94.0,
            ),
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 10.0,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      model.appName,
                      style: TextStyle(
                        inherit: false,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF333333),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 4.0,
                      ),
                      child: Text(
                        model.environment,
                        style: TextStyle(
                          inherit: false,
                          fontSize: 15.0,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  model.bundleId,
                  style: TextStyle(
                    inherit: false,
                    fontSize: 13.0,
                    color: Color(0xFF4A4A4A),
                  ),
                ),
                Text(
                  'Version ${model.version} (${model.build})',
                  style: TextStyle(
                    inherit: false,
                    fontSize: 13.0,
                    color: Color(0xFF666666),
                  ),
                ),
                RoundCornerButton(
                  title: '安装',
                  maxWidth: 54.0,
                  maxHeight: 24.0,
                  color: CupertinoColors.activeBlue,
                  titleStyle: TextStyle(
                    inherit: false,
                    fontSize: 10.0,
                    color: CupertinoColors.white,
                  ),
                  onTapped: () {
                    onInstalled(model.downloadLink);
                  },
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
        ],
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
      height: maxHeight == null ? 124.0 : maxHeight,
    );
  }
}
