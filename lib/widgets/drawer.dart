import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:the_yummies/screens/editmealscreen.dart';
import '../screens/new_meal_screen.dart';
import '../providers/authorization.dart';
import 'package:provider/provider.dart';
class FiltersAndEDit extends StatelessWidget {
  const FiltersAndEDit({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 270,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          const Divider(
            color: Colors.pinkAccent,
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 60,
            width: double.infinity,
            child: Row(
              children: [
                GradientText(
                  '  Lets Prepare Yummies',
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                  colors: const [
                    Color.fromARGB(255, 230, 11, 91),
                    Color.fromARGB(255, 237, 29, 154),
                    Color.fromARGB(255, 192, 20, 158),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(Icons.restaurant_menu_rounded),
              ],
            ),
          ),
          const Divider(
            color: Colors.pinkAccent,
          ),
          ListTile(
            leading: const Icon(
              Icons.food_bank_outlined,
              color: Colors.purple,
            ),
            title: const Text(
              'All Meals',
              style: TextStyle(
                  fontSize: 15,
                  decoration: TextDecoration.none,
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.edit_rounded,
              color: Colors.purple,
            ),
            title: const Text(
              'Edit Meals',
              style: TextStyle(
                  fontSize: 15,
                  decoration: TextDecoration.none,
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(EditMeals.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.fastfood_outlined,
              color: Colors.purple,
            ),
            title: const Text(
              'Add New Meal',
              style: TextStyle(
                  fontSize: 15,
                  decoration: TextDecoration.none,
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(NewMealScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app,color: Colors.purple,),
            title: const Text(
              'Log-Out',
              style: TextStyle(
                  fontSize: 15,
                  decoration: TextDecoration.none,
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Authorization>(context, listen: false).logOut();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Logged Out Successfully!!'),
                  elevation: 5,
                  dismissDirection: DismissDirection.down,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
