import 'package:flutter/material.dart';
import 'package:foodapp/screens/categories_screen.dart';
import 'package:foodapp/screens/meals_screen.dart';

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
        accentColor: Colors.blue,
        canvasColor: Color.fromRGBO(255, 255, 255, .85),
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            title: TextStyle(
                fontSize: 20,
                fontFamily: 'ZillaSlab',
                fontWeight: FontWeight.w700)),
      ),
      home: CategoriesScreen(),
      routes: {MealScreen.routeName: (context) => MealScreen()},
    );
  }
}
