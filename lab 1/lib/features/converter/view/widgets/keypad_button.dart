import 'package:flutter/material.dart';

class KeypadButton extends StatelessWidget {
  final String value;
  final bool isSpecial;
  final VoidCallback onTap;

  const KeypadButton({
    required this.value,
    required this.onTap,
    this.isSpecial = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: isSpecial ? Colors.green.shade50 : Colors.grey.shade50,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: isSpecial ? Colors.green.shade100 : Colors.grey.shade200,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              color: isSpecial ? Colors.lightGreen : Colors.black87,
              fontSize: value == '⌫' ? 18 : 25,
              fontWeight: isSpecial ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
