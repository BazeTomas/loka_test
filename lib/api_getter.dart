import 'package:http/http.dart'as http;
import 'dart:convert';
import 'recipe_ingredient.dart';

Future<List> fetchData() async {
  final response = await http.get(Uri.parse('https://raw.githubusercontent.com/teijo/iba-cocktails/master/recipes.json'));
  List<Recipe> recipes = <Recipe>[];
  if(response.statusCode==200){
    final String receivedJson = response.body;
    List<dynamic> list = jsonDecode(receivedJson);
    for(int i=0;i<list.length;i++){
      Recipe recipe = Recipe.fromJson(list[i]);
      recipes.add(recipe);
    }
    return recipes;

  }
  else{
    throw Exception('Failed to load data');
  }
}

