import 'package:flutter/material.dart';

class ReusableInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isPassword;
  final String? obsecureText;
  final String? hintText;
  final Widget? prefixIcon;
  final double? height;
  final double? width;
  final double? borderValue;
  final bool hasBorder;
  final FormFieldValidator? validator;
  const ReusableInputField({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.obsecureText = '*',
    this.hintText,
    this.prefixIcon,
    this.height = 45.0,
    this.width = double.infinity,
    this.hasBorder = true,
    this.borderValue = 8.0,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: isPassword!,
      obscuringCharacter: obsecureText!,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
        constraints: BoxConstraints(maxHeight: height!, maxWidth: width!),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black45, fontSize: 12.0),
        prefixIcon: prefixIcon,
        // suffixIcon: ,
        border:
            hasBorder
                ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderValue!),
                  borderSide: BorderSide(color: Colors.grey),
                )
                : InputBorder.none,
        focusedBorder:
            hasBorder
                ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderValue!),
                  borderSide: BorderSide(color: Colors.blue),
                )
                : InputBorder.none,
      ),
    );
  }
}
