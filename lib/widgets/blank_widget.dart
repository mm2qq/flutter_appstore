import 'package:flutter/widgets.dart';

class BlankWidget extends StatelessWidget {
  BlankWidget({
    Key key,
    this.color,
    @required this.maxHeight,
  }) : super(key: key);

  final Color color;

  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: maxHeight,
      ),
      color: color,
    );
  }
}
