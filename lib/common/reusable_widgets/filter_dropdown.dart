import 'package:ecom/common/reusable_widgets/reusbleContaianer.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class JFilterDropDown extends StatelessWidget {
  const JFilterDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return JReusableContainer(
      borderColor: Colors.blueAccent,
      showBorder: true,

      child: DropdownButtonFormField(
        items:
            [
                  "name",
                  "Price",
                  "Availability",
                  "Sale",
                  "Newest",
                  "Higher Price",
                  "Lower Price",
                ]
                .map(
                  (option) =>
                      DropdownMenuItem(value: option, child: Text(option)),
                )
                .toList(),
        onChanged: (value) {},
        decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
      ),
    );
  }
}
