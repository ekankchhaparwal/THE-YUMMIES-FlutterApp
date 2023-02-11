import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_yummies/providers/allDishes.dart';
import 'package:the_yummies/widgets/drawer.dart';
import '../widgets/recipiesgrid.dart';

enum FavouriteFilter { Favourites, ShowAllRecipies, Vegetarian, NonVegetarian }

class AllRecipies extends StatefulWidget {
  @override
  State<AllRecipies> createState() => _AllRecipiesState();
}

class _AllRecipiesState extends State<AllRecipies> {
  var _showFavourites = false;
  var _isVeg = false;
  var _showAll = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yummy Food'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FavouriteFilter selectedValue) {
              setState(() {
                if (selectedValue == FavouriteFilter.Favourites) {
                  _showFavourites = true;
                  _showAll = false;
                } else if (selectedValue == FavouriteFilter.Vegetarian) {
                  _isVeg = true;
                  _showAll = false;
                  _showFavourites = false;
                } else if (selectedValue == FavouriteFilter.NonVegetarian) {
                  _isVeg = false;
                } else if (selectedValue == FavouriteFilter.ShowAllRecipies) {
                  _showAll = true;
                  _showFavourites = false;
                }
              });
            },
            color: Colors.white,
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FavouriteFilter.Favourites,
                child: Text(
                  "Favourites",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const PopupMenuItem(
                value: FavouriteFilter.ShowAllRecipies,
                child: Text(
                  "All Recipies",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const PopupMenuItem(
                value: FavouriteFilter.Vegetarian,
                child: Text(
                  "Vegetarian",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const PopupMenuItem(
                value: FavouriteFilter.NonVegetarian,
                child: Text(
                  "Non-Vegetarian",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Provider.of<AllDishesRecipie>(context,listen: false).addOnce();
      //   },
      //   elevation: 6,
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.purpleAccent,
      //   splashColor: Colors.deepOrange,
      // ),
      drawer: const FiltersAndEDit(),
      body: RecipiesGrid(_showFavourites, _showAll, _isVeg),
    );
  }
}
