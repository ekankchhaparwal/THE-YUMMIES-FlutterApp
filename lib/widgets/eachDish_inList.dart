import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/allDishes.dart';
import '../screens/edit_yourmeal_screen.dart';

class DishIndividualItem extends StatelessWidget {
  final String title;
  final String ImageUrl;
  final String Id;

  DishIndividualItem(this.title, this.ImageUrl, this.Id);
  bool _didDelete = false;
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
              Navigator.of(context).pushNamed(
                  EditYourMealRecipieScreen.routeName,
                  arguments: Id);
            },
            icon: const Icon(
              Icons.edit,
              color: Color.fromARGB(255, 38, 227, 44),
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog<bool>(
                context: context,
                builder: (ctx) => AlertDialog(
                  backgroundColor: Color.fromARGB(255, 241, 185, 240),
                  icon: const Icon(
                    Icons.add_alert_outlined,
                    color: Colors.red,
                  ),
                  title: const Text("Alert !!"),
                  content: Text(
                    "Are you sure you want to Delete $title recipie ?",
                    style: TextStyle(fontFamily: 'Lato'),
                    softWrap: true,
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 162, 235, 164)),
                        padding: const EdgeInsets.all(14),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(fontFamily: 'Lato',fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                    TextButton(
                      onPressed: () {
                        Provider.of<AllDishesRecipie>(context, listen: false)
                            .deleteDish(Id);
                        _didDelete = true;
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 162, 235, 164)),
                        padding: const EdgeInsets.all(14),
                        child: const Text(
                          "Yes",
                          style: TextStyle(fontFamily: 'Lato',fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ).then((value) {
                if (_didDelete) {
                  _didDelete = false;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        'Recipie Deleted Successfully!',
                        style: TextStyle(fontFamily: 'Lato'),
                      ),
                      elevation: 5,
                      duration: Duration(milliseconds: 1200),
                      behavior: SnackBarBehavior.floating,
                      dismissDirection: DismissDirection.down,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  );
                }
              });
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
