import 'package:flutter/material.dart';
import 'package:pam_lab2/recipecard.dart';

class FeaturedRecipes extends StatelessWidget {
  final List<Map<String, dynamic>> recipes = [
    {
      'imagePath': 'assets/images/classic_greek_salad.png',
      'title': 'Classic Greek Salad',
      'rating': 4.5,
      'time': '15 Mins',
    },
    {
      'imagePath': 'assets/images/crunchy_nut_coleslaw.png',
      'title': 'Crunchy Nut Coleslaw',
      'rating': 3.5,
      'time': '10 Mins',
    },
    {
      'imagePath': 'assets/images/classic_greek_salad.png',
      'title': 'Classic Greek Salad',
      'rating': 4.5,
      'time': '15 Mins',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: recipes.length,
        separatorBuilder: (_, __) => SizedBox(width: 16),
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return RecipeCard(
            imagePath: recipe['imagePath'],
            title: recipe['title'],
            rating: recipe['rating'],
            time: recipe['time'],
          );
        },
      ),
    );
  }
}