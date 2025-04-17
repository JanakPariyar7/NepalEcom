import 'package:ecom/common/reusable_widgets/reusable_input_fields_buttons.dart';
import 'package:ecom/common/reusable_widgets/reusbleContaianer.dart';
import 'package:flutter/material.dart';

class JCoupounSection extends StatelessWidget {
  const JCoupounSection({super.key, required this.couponController});

  final TextEditingController couponController;

  @override
  Widget build(BuildContext context) {
    return JReusableContainer(
      showBorder: true,
      borderColor: Colors.blueGrey,
      padding: EdgeInsets.all(8),

      child: Row(
        children: [
          Flexible(
            child: ReusableInputField(
              controller: couponController,
              hintText: "Enter Your Coupon here",
              hasBorder: false,
            ),
          ),

          JReusableContainer(
            backgroundColor: Colors.blueAccent,
            height: 45.0,
            padding: EdgeInsets.all(8),
            onTap: () {},
            child: Text("Apply Coupon"),
          ),
        ],
      ),
    );
  }
}
