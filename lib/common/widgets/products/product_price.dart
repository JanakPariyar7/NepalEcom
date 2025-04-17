import 'package:flutter/material.dart';

class JProductPriceText extends StatelessWidget {
  const JProductPriceText({
    super.key,
    required this.price,
    this.currencySign = 'Rs.',
    this.isLarge = false,
    this.lineThrough = false,
    this.maxLines = 1,
  });

  final String price;
  final String currencySign;
  final bool isLarge, lineThrough;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style:
          isLarge
              ? Theme.of(context).textTheme.headlineMedium!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null,
              )
              : Theme.of(context).textTheme.bodyLarge!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null,
              ),
    );
  }
}
