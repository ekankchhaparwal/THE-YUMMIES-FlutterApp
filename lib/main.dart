

import 'package:flutter/material.dart';
import 'package:the_yummies/screens/RecippieDetailScreen.dart';
import './screens/all_recipies.dart';
import 'package:provider/provider.dart';
import './providers/allDishes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AllDishesRecipie(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yummies',
        theme: ThemeData(
          fontFamily: 'Lato',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                bodyText2: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
              ),
          hintColor: Colors.blue,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Color.fromARGB(255, 84, 228, 61)),
        ),
        home: AllRecipies(),
        routes: {
          RecipieDetailScreen.routeName: (ctx) => RecipieDetailScreen(),
        },
      ),
    );
  }
}
