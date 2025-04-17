import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Jcircle extends StatelessWidget {
  const Jcircle({
    super.key,
    this.circleRadius = 400,
    this.circleHeight = 400,
    this.circleWidth = 400,

    this.circleColor = JColors.white,
    this.circlePadding = 0,
    this.child,
    this.margin,
  });

  final double circleRadius, circleHeight, circleWidth, circlePadding;
  final EdgeInsets? margin;

  final Color circleColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(circlePadding),
      margin: margin,
      height: circleHeight,
      width: circleHeight,
      decoration: BoxDecoration(
        color: circleColor,
        borderRadius: BorderRadius.circular(circleRadius),
      ),

      child: child,
    );
  }
}

class JcustomEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 30);
    final lastCurve = Offset(30, size.height - 30);

    path.quadraticBezierTo(
      firstCurve.dx,
      firstCurve.dy,
      lastCurve.dx,
      lastCurve.dy,
    );

    final secondFirstCurve = Offset(0, size.height - 30);
    final secondLastCurve = Offset(size.width - 30, size.height - 30);

    path.quadraticBezierTo(
      secondFirstCurve.dx,
      secondFirstCurve.dy,
      secondLastCurve.dx,
      secondLastCurve.dy,
    );

    final thirdFirstCurve = Offset(size.width, size.height - 30);
    final thirdLastCurve = Offset(size.width, size.height);

    path.quadraticBezierTo(
      thirdFirstCurve.dx,
      thirdFirstCurve.dy,
      thirdLastCurve.dx,
      thirdLastCurve.dy,
    );

    // path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class JCurverEdgesWidget extends StatelessWidget {
  const JCurverEdgesWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: JcustomEdges(), child: child);
  }
}

//cart counter and cart in notification style

class JCartCounterWidget extends StatelessWidget {
  const JCartCounterWidget({
    super.key,
    this.onPressed,
    this.counter,
    this.iconColor = Colors.white,
  });
  final VoidCallback? onPressed;
  final int? counter;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
            size: JSizes.iconMd,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 18.0,
            width: 18.0,

            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Center(
              child: Text(
                '$counter',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.apply(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class JsectionHeader extends StatelessWidget {
  const JsectionHeader({
    super.key,
    required this.sectionHeader,
    this.sectionActionButtomTitle = 'view all',
    this.hasSectionButton = true,
    this.onPressed,
    this.sectionColor = Colors.black,
    this.padding = EdgeInsets.zero,
  });

  final String sectionHeader;
  final String? sectionActionButtomTitle;
  final bool hasSectionButton;
  final VoidCallback? onPressed;
  final Color? sectionColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sectionHeader,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.apply(color: sectionColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (hasSectionButton == true)
            TextButton(
              onPressed: onPressed,
              child: Text(sectionActionButtomTitle!),
            ),
        ],
      ),
    );
  }
}
