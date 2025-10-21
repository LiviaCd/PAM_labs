import 'package:flutter/material.dart';

class RecipeInfoToggle extends StatefulWidget {
  const RecipeInfoToggle({super.key});

  @override
  State<RecipeInfoToggle> createState() => _RecipeInfoToggleState();
}

class _RecipeInfoToggleState extends State<RecipeInfoToggle> {
  final categories = ["Ingredient", "Procedure"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33, // row height
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 15),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return SizedBox(
            width: 150,
            height: 33,
            child: ChoiceChip(
              label: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    fontSize: 11,
                    color: isSelected ? Colors.white : const Color(0xFF129575),
                  ),
                ),
              ),
              selected: false,
              onSelected: (_) {
                setState(() {
                  selectedIndex = index;
                });
              },
              backgroundColor: isSelected
                  ? const Color(0xFF129575)
                  : Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.transparent),
              ),
              padding: EdgeInsets.zero,
              materialTapTargetSize:
              MaterialTapTargetSize.shrinkWrap,
            ),
          );
        },
      ),
    );
  }
}
