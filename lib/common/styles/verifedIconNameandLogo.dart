import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class JverifiedBrandNameandIcon extends StatelessWidget {
  const JverifiedBrandNameandIcon({
    super.key,
    required this.brandName,
    this.isVerified = true,
  });

  final String brandName;
  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //brand name
        Text(
          brandName,
          style: Theme.of(context).textTheme.bodyMedium,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),

        //Brand verify Small Icon
        Icon(
          isVerified ? Iconsax.verify5 : null,
          color: Colors.blueAccent,
          size: JSizes.iconXs,
        ),
      ],
    );
  }
}
