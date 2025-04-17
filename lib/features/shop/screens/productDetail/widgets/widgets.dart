import 'package:ecom/common/common_styles.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class JScrollableImageBox extends StatelessWidget {
  const JScrollableImageBox({
    super.key,
    this.height = 150,
    this.header = 'Variation',
  });

  final double? height;
  final String? header;

  @override
  Widget build(BuildContext context) {
    // List of shoe images (for variations)
    final List<String> shoeVariations = [
      JImagesPath.getShoeImage(1),
      JImagesPath.getShoeImage(2),
      JImagesPath.getShoeImage(3),
      JImagesPath.getShoeImage(4),
    ];

    return Column(
      children: [
        Text(
          header!,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: height,
          child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical, // Change to horizontal if needed
            itemCount: shoeVariations.length,
            itemBuilder: (context, index) {
              return JVariationImages(image: shoeVariations[index]);
            },
          ),
        ),
      ],
    );
  }
}

class JVariationImages extends StatelessWidget {
  const JVariationImages({
    super.key,
    this.height = 48,
    this.width = 48,
    required this.image,
  });

  final double height, width;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4), // Adds spacing
      child: SizedBox(
        height: height,
        width: width,
        child: JroundedImage(imageUrl: image),
      ),
    );
  }
}
