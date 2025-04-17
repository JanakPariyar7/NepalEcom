import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RatingprofileSection extends StatelessWidget {
  const RatingprofileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(JImagesPath.avatar)),
            SizedBox(width: JSizes.sm),
            Text("John Doe"),
          ],
        ),

        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
      ],
    );
  }
}
