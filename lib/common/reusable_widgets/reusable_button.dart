import 'package:flutter/material.dart';

enum ButtonType { elevated, outlined, text }

class ReusableButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final ButtonType buttonType;
  final double? width; // Added width property

  const ReusableButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    this.buttonType = ButtonType.elevated,
    this.width, // Initialize width
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultTextStyle =
        textStyle ??
        TextStyle(
          color: textColor ?? Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        );

    final ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: WidgetStateProperty.all(backgroundColor ?? Colors.blue),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
      ),
      padding: WidgetStateProperty.all(padding),
    );

    Widget button;
    switch (buttonType) {
      case ButtonType.elevated:
        button = ElevatedButton(
          onPressed: onPressed,
          style: buttonStyle,
          child: Text(text, style: defaultTextStyle),
        );
        break;

      case ButtonType.outlined:
        button = OutlinedButton(
          onPressed: onPressed,
          style: buttonStyle.copyWith(
            side: WidgetStateProperty.all(BorderSide(color: Colors.blue)),
          ),
          child: Text(
            text,
            style: defaultTextStyle.copyWith(color: Colors.blue),
          ),
        );
        break;

      case ButtonType.text:
        button = TextButton(
          onPressed: onPressed,
          style: ButtonStyle(padding: WidgetStateProperty.all(padding)),
          child: Text(
            text,
            style: defaultTextStyle.copyWith(color: Colors.red),
          ),
        );
        break;
    }

    return width != null
        ? SizedBox(width: width, child: button) // Apply width if provided
        : button; // Return button without a fixed width
  }
}
