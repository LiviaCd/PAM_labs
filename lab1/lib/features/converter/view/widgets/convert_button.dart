import 'package:flutter/material.dart';

class ConvertButton extends StatelessWidget {
  final VoidCallback onTap;
  const ConvertButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightGreen,
          shape: const CircleBorder(),
          elevation: 6,
        ),
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
