import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/recipe.dart';
import '../models/category.dart';

class DataRepository {
  static const String _recipesPath = 'lib/data/recipes.json';
  static const String _categoriesPath = 'lib/data/categories.json';

  /// Loads recipes from JSON file asynchronously
  Future<List<Recipe>> loadRecipes() async {
    try {
      final String jsonString = await rootBundle.loadString(_recipesPath);
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> recipesJson = jsonData['recipes'] ?? [];
      
      return recipesJson
          .map((json) => Recipe.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error loading recipes: $e');
      return [];
    }
  }

  /// Loads categories from JSON file asynchronously
  Future<List<Category>> loadCategories() async {
    try {
      final String jsonString = await rootBundle.loadString(_categoriesPath);
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> categoriesJson = jsonData['categories'] ?? [];
      
      return categoriesJson
          .map((json) => Category.fromJson(json as String))
          .toList();
    } catch (e) {
      print('Error loading categories: $e');
      return [];
    }
  }

  /// Filters recipes by category
  List<Recipe> filterRecipesByCategory(List<Recipe> recipes, String category) {
    if (category == 'All') {
      return recipes;
    }
    return recipes.where((recipe) => recipe.category == category).toList();
  }

  /// Searches recipes by title
  List<Recipe> searchRecipes(List<Recipe> recipes, String query) {
    if (query.isEmpty) {
      return recipes;
    }
    return recipes
        .where((recipe) => 
            recipe.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
