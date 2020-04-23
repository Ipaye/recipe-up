import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/meals_screen.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Planner',
      theme: ThemeData(
        fontFamily: 'Lato',
        primarySwatch: Colors.amber,
        accentColor: Colors.purple,
        canvasColor: Color.fromRGBO(255, 255, 255, .85),
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            title: TextStyle(
                fontSize: 20,
                fontFamily: 'ZillaSlab',
                fontWeight: FontWeight.w700)),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        MealScreen.routeName: (context) => MealScreen(),
        MealDetailSceen.routeName: (context) => MealDetailSceen(),
      },
    );
  }
}
