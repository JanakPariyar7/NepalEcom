import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class JProfileInformation extends StatelessWidget {
  const JProfileInformation({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon = Iconsax.arrow_right_34,
    required this.onTap,
  });

  final String title, subtitle;
  final IconData? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(title)),
          Expanded(flex: 5, child: Text(subtitle)),
          Expanded(
            flex: 1,
            child: IconButton(onPressed: onTap, icon: Icon(icon)),
          ),
        ],
      ),
    );
  }
}
