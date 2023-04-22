import 'package:flutter/material.dart';
import 'package:the_yummies/providers/dishItem.dart';
import 'package:the_yummies/screens/RecippieDetailScreen.dart';
import 'package:the_yummies/screens/auth_screen.dart';
import 'package:the_yummies/screens/edit_yourmeal_screen.dart';
import './screens/all_recipies.dart';
import 'package:provider/provider.dart';
import './providers/allDishes.dart';
import './screens/editmealscreen.dart';
import './screens/new_meal_screen.dart';
import './providers/authorization.dart';
import './screens/SplashScreen.dart';

void main()  {
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
            create: (context) => Authorization(),
          ),
          ChangeNotifierProxyProvider<Authorization, AllDishesRecipie>(
            create: (context) => AllDishesRecipie([], ""),
            update: (context, auth, previous) => AllDishesRecipie(
                previous == null ? [] : previous.allDishes,
                auth.Token.toString()),
          ),
        ],
        child: Consumer<Authorization>(
          builder: (context, authorize, _) => MaterialApp(
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
            home: authorize.isAuth
                ? AllRecipies()
                : FutureBuilder(
                    future: authorize.tryAutoLogin(),
                    builder: (ctx, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? SplashScreen()
                            : AuthScreen(),
                  ),
            routes: {
              RecipieDetailScreen.routeName: (ctx) => RecipieDetailScreen(),
              EditMeals.routeName: (ctx) => EditMeals(),
              NewMealScreen.routeName: (ctx) => NewMealScreen(),
              EditYourMealRecipieScreen.routeName: (ctx) =>
                  EditYourMealRecipieScreen(),
            },
          ),
        ));
  }
}
