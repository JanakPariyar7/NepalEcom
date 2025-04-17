import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class JanimationLoaderWidget extends StatelessWidget {
  final String text;
  final String animation;

  const JanimationLoaderWidget({
    Key? key,
    required this.text,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(animation, width: 200, height: 200, fit: BoxFit.contain),
        const SizedBox(height: 16),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
