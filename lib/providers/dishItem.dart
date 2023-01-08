import 'package:flutter/cupertino.dart';

enum Difficulty { Simple, Medium, Professional }

class DishItem with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  final bool vegetarian;
  final List<String> recipieDescription;
  final int preparationTime;
  final int preparationCost;
  final Difficulty difficulty;
  bool isFavourite;

  DishItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.recipieDescription,
    required this.difficulty,
    required this.vegetarian,
    required this.preparationTime,
    required this.preparationCost,
    this.isFavourite = false,
  });

  void toggleFavourite() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
