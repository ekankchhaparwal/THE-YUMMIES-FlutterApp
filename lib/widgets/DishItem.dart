import 'package:flutter/material.dart';
import '../providers/dishItem.dart';
import 'package:provider/provider.dart';
import '../screens/RecippieDetailScreen.dart';

class DishItemBuild extends StatelessWidget {
  const DishItemBuild({super.key});

  @override
  Widget build(BuildContext context) {
    final dishItem = Provider.of<DishItem>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        footer: GridTileBar(
          leading: Consumer<DishItem>(
            builder: (context, value, child) => IconButton(
              icon: Icon(
                dishItem.isFavourite ? Icons.favorite : Icons.favorite_border,
                color: Colors.pink,
              ),
              onPressed: () {
                dishItem.toggleFavourite();
              },
            ),
          ),
          backgroundColor: Color.fromARGB(221, 31, 30, 30),
          title:  Text(
            dishItem.title,
            softWrap: true,
          ),
        ),
        child: InkWell(
          splashColor: Color.fromARGB(255, 105, 235, 110),
          onTap: () {
            Navigator.of(context).pushNamed(
              RecipieDetailScreen.routeName,
              arguments: dishItem.id,
            );
          },
          child: Image.network(
            dishItem.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
