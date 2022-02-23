import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:resep/views/widget/recipe_card.dart';

class Detailresep extends StatelessWidget {
  final String name;
  final String images;
  final String rating;
  final String totalTime;
  final String description;

  Detailresep(
    {
      required this.name,
      required this.images,
      required this.rating,
      required this.totalTime,
      required this.description
    }
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.restaurant_menu),
          SizedBox(width: 10),
          Text('Detail Resep Makanan')

        ],
      ),
    ),
    body: SafeArea(child: Column(
      children: [
        RecipeCard(
                      title: name,
                      cookTime: totalTime,
                      rating: rating.toString(),
                      thumbnailUrl:images,
                      ),
                   Container(
                     child: Column(children: [
                       Text('Deskripsi Makanan', style: TextStyle(color: Colors.black,
                       fontWeight: FontWeight.bold, fontSize: 20),
                       textAlign: TextAlign.left,
                       ),
                     Text(description,
                     style: TextStyle(color: Colors.black),
                     textAlign: TextAlign.justify,)
                     ],
                     ),
                   ), 
      ],
    )),
    );
  }
}