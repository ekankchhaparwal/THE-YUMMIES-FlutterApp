import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import 'package:provider/provider.dart';
import '../providers/allDishes.dart';
import '../widgets/eachDish_inList.dart';
import '../screens/new_meal_screen.dart';

class EditMeals extends StatelessWidget {
  const EditMeals({super.key});
  static const routeName = '/editmeals';
  @override
  Widget build(BuildContext context) {
    final allDishes = Provider.of<AllDishesRecipie>(context).allDishes;
    return Scaffold(
        body: Scaffold(
      appBar: AppBar(
        title: const Text('Your Meals'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(NewMealScreen.routeName);
              },
              icon: const Icon(Icons.add)),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(NewMealScreen.routeName);
        },
        elevation: 6,
        child: Icon(Icons.add),
        backgroundColor: Colors.purpleAccent,
        splashColor: Colors.deepOrange,
      ),
      drawer: const FiltersAndEDit(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: ((_, index) => Column(
                children: [
                  DishIndividualItem(
                    allDishes[index].title,
                    allDishes[index].imageUrl,
                    allDishes[index].id,
                  ),
                  const Divider(
                      thickness: 2,
                      color: Color.fromARGB(255, 232, 132, 212),
                      indent: 2),
                ],
              )),
          itemCount: allDishes.length,
        ),
      ),
    ));
  }
}
