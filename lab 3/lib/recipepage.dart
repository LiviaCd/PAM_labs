import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pam_lab2/pageoptions.dart';
import 'package:pam_lab2/recipeinfotoggle.dart';
import 'package:pam_lab2/recipeingredients.dart';
import 'package:pam_lab2/recipeoverview.dart';
import 'package:pam_lab2/userinformation.dart';
import 'controllers/recipe_controller.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});
  RecipeController get recipeController => Get.find<RecipeController>();

  @override
  Widget build(BuildContext context) {
    final recipe = recipeController.selectedRecipe;
    // Fallback: if route opened without selection, pick first recipe if available
    final fallback = (recipeController.filteredRecipes.isNotEmpty)
        ? recipeController.filteredRecipes.first
        : null;
    final r = recipe ?? fallback;
    if (r == null) {
      return const Scaffold(
        body: Center(child: Text('No recipe selected')),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: const PageOptions(),
              ),
              const SizedBox(height: 10),
              RecipeOverview(
                imageUrl: r.imagePath,
                preptime: r.time,
                score: r.rating,
                name: r.title,
                reviewCount: r.reviewCount,
              ),
              const SizedBox(height: 10),
              UserInformation(name: 'Chef', address: 'Unknown'),
              const SizedBox(height: 20),
              RecipeInfoToggle(),
              const SizedBox(height: 35),
              RecipeIngredients(
                serves: r.serves,
                ingredients: r.ingredients
                    .map((i) => IngredientCard(
                          name: i.name,
                          imageUrl: i.imagePath,
                          grams: i.grams,
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
