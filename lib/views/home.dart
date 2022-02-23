import 'package:flutter/material.dart';
import 'package:resep/models/new_receipe_model.dart';
import 'package:resep/models/recipe.api.dart';
import 'package:resep/models/recipe.dart';
import 'package:resep/views/detail_resep.dart';
import 'package:resep/views/widget/recipe_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NewReceipeModel _recipes;
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
            Text('Food Recipe'),
          ],
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _recipes.feed!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: RecipeCard(
                    title: _recipes.feed![index].content!.details!.name!,
                    cookTime: _recipes.feed![index].content!.details!.totalTime!,
                    rating: _recipes.feed![index].content!.details!.rating.toString(),
                    thumbnailUrl: _recipes.feed![index].content!.details!.images![0].hostedLargeUrl!,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detailresep(
                          name: _recipes.feed![index].content!.details!.name!,
                          totalTime: _recipes.feed![index].content!.details!.totalTime!,
                          rating: _recipes.feed![index].content!.details!.rating.toString(),
                          images: _recipes.feed![index].content!.details!.images![0].hostedLargeUrl!,
                          description: _recipes.feed![index].content!.description!.text!,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
