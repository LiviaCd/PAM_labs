import 'package:flutter/material.dart';
import 'package:pam_lab2/recipehomepage.dart';
import 'package:pam_lab2/recipepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipeHomePage(),
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      routes: {
        '/recipepage': (context) => RecipePage(),
      },
    );
  }
}