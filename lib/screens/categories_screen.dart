import 'package:flutter/material.dart';
import 'package:foodapp/widgets/category_items.dart';

import '../mock.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meal Planner',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
            children: DUMMY_CATEGORIES
                .map((categoryData) => CategoryItem(
                      id: categoryData.id,
                      title: categoryData.title,
                      color: categoryData.color,
                    ))
                .toList(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20)),
      ),
    );
  }
}
