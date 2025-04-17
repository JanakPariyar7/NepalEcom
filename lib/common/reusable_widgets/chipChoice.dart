import 'package:ecom/common/reusable_widgets/reusbleContaianer.dart';
import 'package:ecom/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

class JChipChoice extends StatelessWidget {
  const JChipChoice({
    super.key,
    required this.lableText,
    required this.selected,
    this.onSelected,
  });

  final String lableText;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final Color? chipColor = JHelperFunctions.getColor(lableText);
    final bool isColorChip = chipColor != null;
    final bool isDarkColor =
        chipColor != null ? chipColor.computeLuminance() < 0.5 : false;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250), // Smooth transitions
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color:
            selected
                ? chipColor?.withOpacity(0.85) ?? Colors.green.shade600
                : Colors.grey.shade300, // Grey when not selected
        borderRadius: BorderRadius.circular(24), // Softer rounded corners
        boxShadow:
            selected
                ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(2, 2),
                  ),
                ]
                : [],
      ),
      child: ChoiceChip(
        label:
            isColorChip
                ? const SizedBox() // No text for color chips
                : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      lableText,
                      style: TextStyle(
                        color: selected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 16, // Slightly larger text
                      ),
                    ),
                  ],
                ),
        selected: selected,
        onSelected: onSelected,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        avatar:
            isColorChip
                ? JReusableContainer(
                  height: 40,
                  width: 40,
                  backgroundColor: chipColor,
                  borderColor: isDarkColor ? Colors.white : Colors.black26,
                  borderRadius: 20, // More rounded
                  borderWidth: 2,
                )
                : null,
        labelPadding: isColorChip ? EdgeInsets.zero : null,
        disabledColor: Colors.grey.shade300,
        checkmarkColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side:
              selected
                  ? BorderSide(color: chipColor ?? Colors.green, width: 2)
                  : BorderSide(color: Colors.grey.shade400),
        ),
        backgroundColor: isColorChip ? chipColor.withOpacity(0.85) : null,
        selectedColor: chipColor ?? Colors.green.shade600,
      ),
    );
  }
}
