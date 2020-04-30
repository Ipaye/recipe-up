import 'package:flutter/material.dart';
import '../mock.dart';

class MealDetailSceen extends StatelessWidget {
  static const routeName = "meal-details";

  final Function toggleFavouriteHandler;
  final Function favouriteStatus;

  MealDetailSceen(this.toggleFavouriteHandler, this.favouriteStatus);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Theme.of(context).primaryColor)),
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            '${index + 1}.  ${selectedMeal.ingredients[index]}',
                            style: TextStyle(
                                fontSize: 17, height: 2, color: Colors.black)),
                        Divider(
                          thickness: 1,
                          height: 1,
                          color: Colors.black54,
                        ),
                      ],
                    );
                  }),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              height: 200,
              margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Theme.of(context).primaryColor)),
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Text('${index + 1}.  ${selectedMeal.steps[index]}',
                            style: TextStyle(
                                fontSize: 17, height: 2, color: Colors.black)),
                        Divider(
                          thickness: 1,
                          height: 1,
                          color: Colors.black54,
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavouriteHandler(mealId),
        child: Icon(favouriteStatus(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
