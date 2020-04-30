import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouriteScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text(
          'You have no favourite meals - Start adding one!',
          style: TextStyle(fontSize: 18),
        ),
      );
    } else {
      return ListView.builder(
          itemCount: favouriteMeals.length,
          itemBuilder: (context, index) {
            return MealItem(
                mealId: favouriteMeals[index].id,
                mealImageUrl: favouriteMeals[index].imageUrl,
                mealDuration: favouriteMeals[index].duration,
                mealComplexity: favouriteMeals[index].complexity,
                mealTitle: favouriteMeals[index].title,
                mealAffordability: favouriteMeals[index].affordability);
          });
    }
  }
}
