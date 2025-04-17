import 'package:ecom/common/reusable_widgets/reusbleContaianer.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return JReusableContainer(
      margin: EdgeInsets.only(bottom: JSizes.defaultSpace),
      backgroundColor: isActive ? Colors.blueAccent : Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Name and Check Mark
                Text("Janak Pariyar"),
                Icon(isActive ? Icons.check_box : null),
              ],
            ),

            //Phone Number
            Text("9806485246"),
            //Address
            Text("Changunaryarn -4 Bhaktapur"),
            Text("Nepal"),
          ],
        ),
      ),
    );
  }
}
