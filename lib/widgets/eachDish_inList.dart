import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/allDishes.dart';
import '../screens/edit_yourmeal_screen.dart';

class DishIndividualItem extends StatelessWidget {
  final String title;
  final String ImageUrl;
  final String Id;

  DishIndividualItem(this.title, this.ImageUrl, this.Id);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(ImageUrl),
      ),
      trailing: Wrap(
        spacing: 12,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(EditYourMealRecipieScreen.routeName,arguments: Id);
            },
            icon: const Icon(
              Icons.edit,
              color: Color.fromARGB(255, 38, 227, 44),
            ),
          ),
          IconButton(
            onPressed: () {
              Provider.of<AllDishesRecipie>(context, listen: false)
                  .deleteDish(Id);
            },
            icon: const Icon(
              Icons.delete,
              color: Color.fromARGB(255, 235, 41, 41),
            ),
          )
        ],
      ),
    );
  }
}
