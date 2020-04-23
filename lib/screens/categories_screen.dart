import 'package:flutter/material.dart';
import '../widgets/category_items.dart';

import '../mock.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
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
    );
  }
}
