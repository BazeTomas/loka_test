import 'package:flutter/material.dart';
import 'recipe_ingredient.dart';
class RecipeDetailScreen extends StatelessWidget{

  final Recipe recipe;

  const RecipeDetailScreen(this.recipe);

  @override
    Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name.toString()),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(recipe.toString(),
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 17.0),)
          ],
        ),
      ),
    );
  }
}