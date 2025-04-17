import 'package:ecom/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('4.8', style: Theme.of(context).textTheme.displayLarge),
        const SizedBox(width: 12),

        // Star distribution
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(5, (index) {
            int star = 5 - index;
            double value = [0.8, 0.6, 0.3, 0.1, 0.05][index]; // Mock values

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  SizedBox(width: 12, child: Text('$star')),
                  const SizedBox(width: 6),
                  Container(
                    width: screenWidth * 0.6,
                    child: LinearProgressIndicator(
                      value: value,
                      backgroundColor: JColors.grey,
                      color: JColors.primaryColor,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
