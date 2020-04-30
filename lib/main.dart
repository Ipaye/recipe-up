import 'package:flutter/material.dart';
import './mock.dart';
import './screens/filters_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/meals_screen.dart';
import './screens/tabs_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['glutten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String id) {
    final exisitingIndex = _favouriteMeals.indexWhere((meal) => meal.id == id);

    if (exisitingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(exisitingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
      });
    }
  }

  bool _isMealFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

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
        '/': (context) => TabsScreen(_favouriteMeals),
        MealScreen.routeName: (context) => MealScreen(_availableMeals),
        MealDetailSceen.routeName: (context) =>
            MealDetailSceen(_toggleFavourite, _isMealFavourite),
        FilterScreen.routeName: (context) =>
            FilterScreen(_filters, _setFilters),
      },
    );
  }
}
