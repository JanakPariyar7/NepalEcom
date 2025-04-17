import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class JTabBar extends StatelessWidget implements PreferredSize {
  const JTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TabBar(
        isScrollable: true,
        automaticIndicatorColorAdjustment: true,

        tabs: [
          Tab(child: Text('Sports')),
          Tab(child: Text('Electronics')),
          Tab(child: Text('Furniture')),
          Tab(child: Text('Clothes')),
          Tab(child: Text('Cosmetics')),
          Tab(child: Text('Sports')),
          Tab(child: Text('Electronics')),
          Tab(child: Text('Furniture')),
          Tab(child: Text('Clothes')),
          Tab(child: Text('Cosmetics')),
        ],
      ),
    );
  }

  @override
  // TODO: implement child
  Size get preferredSize => Size.fromHeight(JDeviceUtils.getAppBarHeight());

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
