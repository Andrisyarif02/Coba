class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;
  final String description;

  Recipe({required this.name, required this.images, required this.rating, required this.totalTime, required this.description});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['name'] as String,
        images: json['images'][0]['hostedLargeUrl'] as String,
        rating: json['rating'] as double,
        totalTime: json['totalTime'] as String,
        description: json['description'] != null ? json ['description'] : " ");
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime, description: $description}';
  }
}