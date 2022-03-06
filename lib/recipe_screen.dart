import 'package:flutter/material.dart';
import 'recipe_ingredient.dart';
class RecipeDetailScreen extends StatelessWidget{

  final Recipe recipe;
  final AssetImage image;
  const RecipeDetailScreen(this.recipe, this.image);

  @override
    Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        
        title: Text(recipe.name.toString()),
        actions: [

          Image(image: image,width: 45,height: 45,)
        ],
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