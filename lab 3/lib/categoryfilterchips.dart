import 'package:flutter/material.dart';

class CategoryFilterChips extends StatefulWidget {
  @override
  _CategoryFilterChipsState createState() => _CategoryFilterChipsState();
}

class _CategoryFilterChipsState extends State<CategoryFilterChips> {
  final List<String> categories = ['All', 'Indian', 'Italian', 'Asian', 'Chinese'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 12),
        itemBuilder: (context, index) {
          bool isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF2E7D7B) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Color(0xFF2E7D7B),
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}