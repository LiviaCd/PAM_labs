import 'package:flutter/material.dart';
import 'keypad_button.dart';
import 'convert_button.dart';

class CustomKeypad extends StatelessWidget {
  final void Function(String) onKeyTap;
  final VoidCallback onConvert;

  const CustomKeypad({
    required this.onKeyTap,
    required this.onConvert,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeypadButton(value: '1', onTap: () => onKeyTap('1')),
              KeypadButton(value: '2', onTap: () => onKeyTap('2')),
              KeypadButton(value: '3', onTap: () => onKeyTap('3')),
              KeypadButton(value: '⌫', onTap: () => onKeyTap('⌫'), isSpecial: true),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeypadButton(value: '4', onTap: () => onKeyTap('4')),
              KeypadButton(value: '5', onTap: () => onKeyTap('5')),
              KeypadButton(value: '6', onTap: () => onKeyTap('6')),
              KeypadButton(value: '-', onTap: () => onKeyTap('-'), isSpecial: true),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeypadButton(value: '7', onTap: () => onKeyTap('7')),
              KeypadButton(value: '8', onTap: () => onKeyTap('8')),
              KeypadButton(value: '9', onTap: () => onKeyTap('9')),
              KeypadButton(value: '.', onTap: () => onKeyTap('.'), isSpecial: true),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 80),
              KeypadButton(value: '0', onTap: () => onKeyTap('0')),
              const SizedBox(width: 80),
              ConvertButton(onTap: onConvert),
            ],
          ),
        ],
      ),
    );
  }
}
