import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'dishItem.g.dart';

enum Difficulty { Simple, Medium, Professional }

@HiveType(typeId: 0)
class DishItem with ChangeNotifier {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String imageUrl;

  @HiveField(3)
  final bool vegetarian;

  @HiveField(4)
  final List<String> recipieDescription;

  @HiveField(5)
  final int preparationTime;

  @HiveField(6)
  final int preparationCost;

  @HiveField(7)
  final Difficulty difficulty;

  @HiveField(8)
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
