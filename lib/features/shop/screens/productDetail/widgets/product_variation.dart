import 'package:ecom/common/reusable_widgets/reusbleContaianer.dart';
import 'package:ecom/features/shop/screens/widgets/widgets.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class JprductVariationSection extends StatelessWidget {
  const JprductVariationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: JSizes.defaultSpace),
      child: JReusableContainer(
        backgroundColor: Colors.grey,

        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace / 2),
          child: Column(
            children: [
              Row(
                children: [
                  JsectionHeader(
                    sectionHeader: 'Variation',
                    hasSectionButton: false,
                    padding: EdgeInsets.all(0),
                  ),
                  SizedBox(width: JSizes.spacebtwnSections),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Product Price
                      Row(
                        children: [
                          Text('Price: '),
                          Text(
                            '1500',
                            style: Theme.of(context).textTheme.titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(width: JSizes.defaultSpace / 2),
                          Text(
                            '1000',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),

                      //Stock Update
                      Row(children: [Text('Stock: '), Text('In Stock')]),
                    ],
                  ),
                ],
              ),
              SizedBox(height: JSizes.spacebtwnItems),
              //Bottom Descriptio
              Text(
                'The iems will be again be loaded after 4 months. soryy to bither you with high waiting time',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
