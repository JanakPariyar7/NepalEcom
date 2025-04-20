import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class JShimmerEffect extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const JShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
