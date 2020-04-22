import 'package:flutter/material.dart';
import 'package:foodapp/models/meal.dart';
import 'package:foodapp/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String mealId;
  final String mealTitle;
  final int mealDuration;
  final Complexity mealComplexity;
  final String mealImageUrl;
  final Affordability mealAffordability;

  MealItem(
      {@required this.mealId,
      @required this.mealImageUrl,
      @required this.mealDuration,
      @required this.mealComplexity,
      @required this.mealTitle,
      @required this.mealAffordability});

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailSceen.routeName, arguments: mealId);
  }

  String get complexityText {
    switch (mealComplexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;

      default:
        return 'Unkown';
    }
  }

  String get affordabilityText {
    switch (mealAffordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;

      default:
        return 'Unkown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 2,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4)),
                  child: Image.network(
                    mealImageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 15,
                    left: 15,
                    child: Container(
                        color: Colors.black87,
                        // width: 350,
                        padding: EdgeInsets.all(5),
                        child: Text(mealTitle,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'ZillaSlab',
                            )))),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '$mealDuration min',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'ZillaSlab',
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.track_changes),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '$complexityText',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'ZillaSlab',
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '$affordabilityText',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'ZillaSlab',
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
