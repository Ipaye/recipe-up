import 'package:flutter/material.dart';
import 'package:foodapp/screens/categories_screen.dart';

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
      ),
      home: CategoriesScreen(),
    );
  }
}
