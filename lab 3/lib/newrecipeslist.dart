import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'newrecipecard.dart';
import 'controllers/recipe_controller.dart';

class NewRecipesList extends StatelessWidget {
  final RecipeController recipeController = Get.find<RecipeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (recipeController.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (recipeController.errorMessage.isNotEmpty) {
        return Center(
          child: Text(
            recipeController.errorMessage,
            style: TextStyle(color: Colors.red),
          ),
        );
      }

      final recipes = recipeController.filteredRecipes;

      if (recipes.isEmpty) {
        return Center(
          child: Text(
            'No recipes found',
            style: TextStyle(color: Colors.grey[600]),
          ),
        );
      }

      return SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return NewRecipeCard(
              title: recipe.title,
              author: 'Chef', // Default author since not in JSON
              rating: recipe.rating.round(), // Convert double to int
              time: recipe.time,
              imagePath: recipe.imagePath,
              authorImagePath: 'assets/images/jamesMilner.png', // Default author image
            );
          },
        ),
      );
    });
  }
}