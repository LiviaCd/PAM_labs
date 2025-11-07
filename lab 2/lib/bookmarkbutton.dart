import 'package:flutter/material.dart';

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: Container(
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Center(
          child: GestureDetector(
            onTap: () {},
            child: Icon(Icons.bookmark_add, size: 16, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
