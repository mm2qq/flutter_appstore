import 'package:flutter/widgets.dart';

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverPersistentHeaderDelegate({
    this.insets,
    @required this.child,
    @required this.height,
  });

  final Widget child;

  final double height;

  final EdgeInsets insets;

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: height,
      padding: insets == null ? EdgeInsets.zero : insets,
      child: child,
      color: Color(0xFFFFFFFF),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
