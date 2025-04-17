import 'package:ecom/common/reusable_widgets/chipChoice.dart';
import 'package:ecom/features/shop/screens/widgets/widgets.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class JProductAttribute extends StatelessWidget {
  const JProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        JsectionHeader(sectionHeader: 'Colors', hasSectionButton: false),
        SizedBox(height: JSizes.spacebtwnItems),
        //Choice chip
        Wrap(
          spacing: 8,
          children: [
            JChipChoice(
              lableText: 'green',
              selected: true,
              onSelected: (value) {},
            ),
            JChipChoice(
              lableText: 'red',
              selected: false,
              onSelected: (value) {},
            ),
            JChipChoice(
              lableText: 'yellow',
              selected: false,
              onSelected: (value) {},
            ),
          ],
        ),

        //Sizes
        JsectionHeader(sectionHeader: 'Sizes', hasSectionButton: false),
        SizedBox(height: JSizes.spacebtwnItems),
        //Choice chip
        Wrap(
          spacing: 8,
          children: [
            JChipChoice(
              lableText: 'EU 34',
              selected: true,
              onSelected: (value) {},
            ),
            JChipChoice(
              lableText: 'EU 35',
              selected: false,
              onSelected: (value) {},
            ),
            JChipChoice(
              lableText: 'EU 36',
              selected: false,
              onSelected: (value) {},
            ),
          ],
        ),
      ],
    );
  }
}
