import 'package:flutter/material.dart';
import 'package:foodapp/models/meal.dart';
import 'package:foodapp/widgets/meal_item.dart';

class MealScreen extends StatefulWidget {
  static const routeName = 'meal-screen';

  final List<Meal> availableMeals;

  MealScreen(this.availableMeals);

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryId = routeArguments['id'];
    final categoryTitle = routeArguments['title'];
    final categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) {
            return MealItem(
                mealId: categoryMeals[index].id,
                mealImageUrl: categoryMeals[index].imageUrl,
                mealDuration: categoryMeals[index].duration,
                mealComplexity: categoryMeals[index].complexity,
                mealTitle: categoryMeals[index].title,
                mealAffordability: categoryMeals[index].affordability);
          }),
    );
  }
}
