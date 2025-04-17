import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class JTextFormFieldTheme {
  JTextFormFieldTheme._(); // Private constructor

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: JColors.darkGrey,
    suffixIconColor: JColors.darkGrey,
    constraints: BoxConstraints.expand(height: JSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
      fontSize: JSizes.fontSizeMd,
      color: JColors.black,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: JSizes.fonJSizesm,
      color: JColors.black,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: JColors.black.withOpacity(0.8),
    ),

    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(JSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: JColors.grey),
    ),

    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(JSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),

    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(JSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: JColors.dark),
    ),

    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(JSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: JColors.warning),
    ),

    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(JSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: JColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: JColors.lightGrey,
    suffixIconColor: JColors.lightGrey,
    constraints: const BoxConstraints.expand(height: JSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
      fontSize: JSizes.fontSizeMd,
      color: JColors.white,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: JSizes.fonJSizesm,
      color: JColors.lighWthite,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: JColors.white.withOpacity(0.8),
    ),

    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(JSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: JColors.lightGrey),
    ),

    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(JSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: JColors.lightGrey),
    ),

    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(JSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: JColors.white),
    ),

    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(JSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: JColors.warning),
    ),

    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(JSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: JColors.warning),
    ),
  );
}
