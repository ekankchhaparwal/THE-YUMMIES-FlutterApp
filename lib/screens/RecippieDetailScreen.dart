import 'package:flutter/material.dart';
import '../providers/allDishes.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class RecipieDetailScreen extends StatelessWidget {
  const RecipieDetailScreen({super.key});
  static const routeName = '/mealsdetail';
  Widget buildHeading(String heading, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GradientText(
        heading,
        style: const TextStyle(
          fontSize: 27.0,
          decoration: TextDecoration.underline,
        ),
        colors: const [
          Color.fromARGB(255, 7, 102, 180),
          Color.fromARGB(255, 29, 36, 237),
          Color.fromARGB(255, 18, 18, 167),
          Color.fromARGB(255, 27, 34, 225),
          Color.fromARGB(255, 7, 101, 177),
        ],
      ),
    );
  }

  Widget buildContainer(Widget child, BuildContext context, int steps) {
    return Container(
      padding: const EdgeInsets.all(10),
      // margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 3),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 78.0 * steps,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    final mealData = Provider.of<AllDishesRecipie>(context).findById(mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealData.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Card(
                  elevation: 9,
                  child: Image.network(
                    mealData.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildHeading("Detailed Recipe", context),
            buildContainer(
                ListView.builder(
                  itemBuilder: ((context, index) => Column(
                        children: <Widget>[
                          ListTile(
                            leading: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 21, 221, 201),
                                    Color.fromARGB(255, 39, 101, 207)
                                  ],
                                ),
                              ),
                              child:
                                  CircleAvatar(child: Text("# ${index + 1}")),
                            ),
                            title: Text(mealData.recipieDescription[index]),
                          ),
                          const Divider(),
                        ],
                      )),
                  itemCount: mealData.recipieDescription.length,
                ),
                context,
                mealData.recipieDescription.length),
          ],
        ),
      ),
    );
  }
}
