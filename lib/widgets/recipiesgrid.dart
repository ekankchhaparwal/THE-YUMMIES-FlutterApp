import '../providers/dishItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/allDishes.dart';
import './DishItem.dart';

class RecipiesGrid extends StatelessWidget {
  final bool isFav;
  final bool showAll;
  final bool isVeg;
  RecipiesGrid(this.isFav, this.showAll, this.isVeg);

  @override
  Widget build(BuildContext context) {
    final MealsData = Provider.of<AllDishesRecipie>(context);
    List<DishItem> MealsList = [];
    if (isFav) {
      MealsList = MealsData.favourites;
    } else if (showAll) {
      MealsList = MealsData.allDishes;
    } else if (isVeg) {
      MealsList = MealsData.vegetarianDishes;
    } else {
      MealsList = MealsData.NonvegetarianDishes;
    }
    return MealsList.isEmpty
        ? isFav
            ? const Center(
                child: Text(
                    'You dont Have Any Favourite Dishes  in this section '),
              )
            : const Center(
                child: Text(''),
              )
        : GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: MealsList[i],
              child: DishItemBuild(),
            ),
            itemCount: MealsList.length,
          );
  }
}
