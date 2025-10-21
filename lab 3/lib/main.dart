import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pam_lab2/recipehomepage.dart';
import 'package:pam_lab2/recipepage.dart';
import 'package:pam_lab2/controllers/recipe_controller.dart';
import 'package:pam_lab2/controllers/category_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipeHomePage(),
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      routes: {
        '/recipepage': (context) => RecipePage(),
      },
      initialBinding: AppBinding(),
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RecipeController());
    Get.put(CategoryController());
  }
}