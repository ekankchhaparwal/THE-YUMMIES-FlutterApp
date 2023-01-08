import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

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
                  '  The Yummies',
                  style: const TextStyle(
                    fontSize: 27.0,
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
        ],
      ),
    );
  }
}
