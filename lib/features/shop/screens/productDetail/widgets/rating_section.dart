import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class JRatingShareSection extends StatelessWidget {
  const JRatingShareSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: JSizes.defaultSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Iconsax.star5, color: Colors.amberAccent),
              SizedBox(width: JSizes.defaultSpace / 2),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '55',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                    TextSpan(
                      text: '(199)',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
          ),
        ],
      ),
      //
    );
  }
}
