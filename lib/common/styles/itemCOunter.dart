import 'package:ecom/common/reusable_widgets/reusbleContaianer.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class JitemCounter extends StatelessWidget {
  const JitemCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        JReusableContainer(
          onTap: () {},
          height: 30,
          width: 30,
          borderRadius: 30,
          backgroundColor: Colors.black54,
          child: Center(child: Icon(Iconsax.minus, color: Colors.white)),
        ),

        //Counter
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: JSizes.sm),
          child: Text('5'),
        ),

        JReusableContainer(
          height: 30,
          width: 30,
          onTap: () {},
          borderRadius: 30,
          backgroundColor: Colors.black,
          child: Center(child: Icon((Iconsax.add), color: Colors.white)),
        ),
      ],
    );
  }
}
