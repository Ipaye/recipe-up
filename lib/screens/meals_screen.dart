import 'package:flutter/material.dart';

import './../mock.dart';

class MealScreen extends StatelessWidget {
  static const routeName = 'meal-screen';

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryId = routeArguments['id'];
    final categoryTitle = routeArguments['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) {
            return Text(categoryMeals[index].title);
          }),
    );
  }
}
