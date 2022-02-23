import 'package:flutter/material.dart';
import 'package:resep/models/recipe.api.dart';
import 'package:resep/models/recipe.dart';
import 'package:resep/views/detail_resep.dart';
import 'package:resep/views/widget/recipe_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('Food Recipe')
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                  child: RecipeCard(
                      title: _recipes[index].name,
                      cookTime: _recipes[index].totalTime,
                      rating: _recipes[index].rating.toString(),
                      thumbnailUrl: _recipes[index].images),
                      onTap: () => {
                        Navigator.push( 
                          context,MaterialPageRoute(builder: 
                          (context) => Detailresep(
                            name: _recipes[index].name,
                            totalTime: _recipes[index].totalTime,
                            rating: _recipes[index].rating.toString(),
                            images: _recipes[index].images,
                            description: _recipes[index].description)
                          ),
                          )
                        
                      },
                  );
                },
              ));
  }
}