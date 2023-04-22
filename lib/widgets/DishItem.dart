import 'package:flutter/material.dart';
import 'package:the_yummies/providers/allDishes.dart';
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
                
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: dishItem.isFavourite
                        ? Text(' Added to Favourites')
                        : Text(' Removed from Favourites'),
                    elevation: 5,
                    duration: Duration(milliseconds: 1500),
                    behavior: SnackBarBehavior.floating,
                    dismissDirection: DismissDirection.down,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                );
              },
            ),
          ),
          backgroundColor: Color.fromARGB(221, 31, 30, 30),
          title: Text(
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
          child: FadeInImage(
            image: NetworkImage(dishItem.imageUrl),
            placeholder: const AssetImage('images/dishImage.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
