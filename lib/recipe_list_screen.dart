import 'package:flutter/material.dart';
import 'api_getter.dart';
import 'recipe_screen.dart';
import 'recipe_ingredient.dart';


class RecipeListScreen extends StatelessWidget{
  const RecipeListScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cocktail recipes'),
      ),
      body: Center(
        child: FutureBuilder<List>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Recipe> recipes = [];
                for(int i=0;i<snapshot.data!.length;i++){
                  recipes.add(snapshot.data![i]);
                }
                recipes.sort((a, b) => b.name.toString().compareTo(a.name.toString()));


                return ListView.builder(itemCount: recipes.length, itemBuilder: (context,index){
                  Recipe recipe = recipes[index];
                  AssetImage image;
                  if(recipe.category.toString()=='Before Dinner Cocktail') {
                     image = const AssetImage('assets/whiskey.png');
                  }
                  else if(recipe.category.toString()=='All Day Cocktail'){

                    image = const AssetImage('assets/all_day_Cocktail.png');
                  }
                  else if(recipe.category.toString()=='Longdrink'){

                    image = const AssetImage('assets/longdrink.png');
                  }
                  else if(recipe.category.toString()=='Sparkling Cocktail'){

                    image = const AssetImage('assets/sparkling_Cocktail.png');
                  }
                  else if(recipe.category.toString()=='After Dinner Cocktail'){

                    image = const AssetImage('assets/after_dinner_Cocktail.png');
                  }
                  else
                    {
                      image = const AssetImage('assets/cocktail.png');
                    }
                  
                  return Card(
                    child: ListTile(
                      title: Text(recipe.name.toString()) ,
                    leading:  Image(image: image,width: 40, height: 40,),
                    subtitle: Text(recipe.category.toString()),
                    trailing: const Icon(Icons.arrow_forward_rounded),
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>RecipeDetailScreen(recipe,image)));},
                    ),
                  );
                }, );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
      ),
    );
  }
}