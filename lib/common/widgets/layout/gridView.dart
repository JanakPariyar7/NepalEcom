import 'package:flutter/material.dart';

class JGridViewLayout extends StatelessWidget {
  const JGridViewLayout({
    super.key,
    required this.itemCount,
    this.crossSpacing = 12.0,
    this.verticalSpacing = 16.0,
    this.mainAxisExtent = 268,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? crossSpacing, verticalSpacing, mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: crossSpacing!,
        mainAxisSpacing: verticalSpacing!,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
