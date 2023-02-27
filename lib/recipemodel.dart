class Recipe{
  final int id;
  final String cuisine;
  final String ingredients;
  final String ratings;
  final String img;

  Recipe(
    {
      required this.id,
      required this.cuisine,
      required this.ingredients,
      required this.ratings,
      required this.img
    }
  );

  factory Recipe.fromJson(Map<String,dynamic> json){
    return Recipe(
      id: json['id'], 
      cuisine: json['cuisine'], 
      ingredients: json['ingredients'], 
      ratings: json['ratings'], 
      img: json['img']
    );
  }
}