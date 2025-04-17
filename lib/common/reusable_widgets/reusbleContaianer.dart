import 'package:flutter/material.dart';

class JReusableContainer extends StatelessWidget {
  const JReusableContainer({
    super.key,
    this.height,
    this.width,
    this.borderRadius = 10.0,
    this.backgroundColor = Colors.white,
    this.child,
    this.showBorder = false,
    this.margin,
    this.padding,
    this.borderColor = Colors.black,
    this.borderWidth = 1.0,
    this.boxShadow,
    this.onTap,
  });

  final double? height;
  final double? width;
  final double borderRadius;
  final Color backgroundColor;
  final Widget? child;
  final bool showBorder;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color borderColor;
  final double borderWidth;
  final List<BoxShadow>? boxShadow;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border:
              showBorder
                  ? Border.all(color: borderColor, width: borderWidth)
                  : null,
          boxShadow: boxShadow,
        ),
        child: child,
      ),
    );
  }
}
