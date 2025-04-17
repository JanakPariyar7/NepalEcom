import 'package:flutter/material.dart';

class JMenuTiles extends StatelessWidget {
  const JMenuTiles({
    super.key,
    this.hasTrailing = false,
    required this.onTap,
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
  });

  final bool hasTrailing;
  final String title, subtitle;
  final IconData leadingIcon;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon((leadingIcon)),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing:
          hasTrailing ? Switch(value: false, onChanged: (value) => {}) : null,
      onTap: onTap,
    );
  }
}
