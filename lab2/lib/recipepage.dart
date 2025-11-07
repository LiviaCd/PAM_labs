import 'package:flutter/material.dart';
import 'package:pam_lab2/pageoptions.dart';
import 'package:pam_lab2/recipeinfotoggle.dart';
import 'package:pam_lab2/recipeingredients.dart';
import 'package:pam_lab2/recipeoverview.dart';
import 'package:pam_lab2/userinformation.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});
  final String imageUrl = 'assets/images/burger.png';
  final String preptime = '20 min';
  final double score = 4.0;
  final String name = 'Spicy chicken burger with French fries';
  final String reviewCount = '13k';
  final String userName = 'Laura Wilson';
  final String userAddress = 'Lagos, Nigeria';

  @override
  Widget build(BuildContext context) {
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
                imageUrl: imageUrl,
                preptime: preptime,
                score: score,
                name: name,
                reviewCount: reviewCount,
              ),
              const SizedBox(height: 10),
              UserInformation(name: userName, address: userAddress),
              const SizedBox(height: 20),
              RecipeInfoToggle(),
              const SizedBox(height: 35),
              RecipeIngredients()
            ],
          ),
        ),
      ),
    );
  }
}
