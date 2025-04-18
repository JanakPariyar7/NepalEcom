import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/text_constants.dart';
import 'package:flutter/material.dart';

class JprivacyPolicy extends StatelessWidget {
  const JprivacyPolicy({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '${JText.agreeTo} '),
          TextSpan(
            text: JText.privacyPolicy,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              color: dark ? JColors.white : JColors.black,
            ),
          ),
          TextSpan(text: ' and '),
          TextSpan(
            text: JText.termsOfUse,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              color: dark ? JColors.white : JColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
