import 'package:flutter/material.dart';

import 'newrecipecard.dart';

class NewRecipesList extends StatelessWidget {
  final List<Map<String, dynamic>> recipes = [
    {
      'title': 'Steak with tomato...',
      'author': 'James Milner',
      'rating': 5,
      'time': '20 mins',
      'imagePath': 'assets/images/steak.png',
      'authorImagePath': 'assets/images/jamesMilner.png',
    },
    {
      'title': 'Pilaf sweet...',
      'author': 'Laura',
      'rating': 5,
      'time': '25 mins',
      'imagePath': 'assets/images/steak.png',
      'authorImagePath': 'assets/images/laura.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return NewRecipeCard(
            title: recipe['title'],
            author: recipe['author'],
            rating: recipe['rating'],
            time: recipe['time'],
            imagePath: recipe['imagePath'],
            authorImagePath: recipe['authorImagePath'],
          );
        },
      ),
    );
  }
}