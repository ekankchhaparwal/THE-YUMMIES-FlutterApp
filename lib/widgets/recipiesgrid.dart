import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../providers/allDishes.dart';
import './DishItem.dart';

class RecipiesGrid extends StatelessWidget {
  final bool isFav;
  RecipiesGrid(this.isFav);

  @override
  Widget build(BuildContext context) {
    Provider.of<AllDishesRecipie>(context, listen: false)
        .getDishesFromStorage();
    final MealsData = Provider.of<AllDishesRecipie>(context);

    final MealsList = isFav ? MealsData.favourites : MealsData.allDishes;
    return GridView.builder(
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
