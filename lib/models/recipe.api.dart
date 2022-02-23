import 'dart:convert';
import 'package:resep/models/new_receipe_model.dart';
import 'package:resep/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<NewReceipeModel> getRecipe() async {
    var uri = Uri.https(
      'yummly2.p.rapidapi.com',
      '/feeds/list',
      {"limit": "18", "start": "0", "tag": "list.recipe.popular"},
    );


    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "391c1f7040mshbae377504e583ddp191521jsn6e2c9a629c86",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map<String, dynamic> data = jsonDecode(response.body);

    return NewReceipeModel.fromJson(data);
  }
}
