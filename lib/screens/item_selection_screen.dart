import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal_category.dart';

class ItemSelectionScreen extends StatelessWidget {
  static const routeName = '/item-selection-screen';

  @override
  Widget build(BuildContext context) {
    final mealCategory =
        ModalRoute.of(context).settings.arguments as MealCategory;
    final myAppBar = AppBar(
      title: Text(
        mealCategory.title,
      ),
    );
    final availableSize = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        myAppBar.preferredSize.height;
    return Scaffold(
      appBar: myAppBar,
      body: Container(
        height: availableSize,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: mealCategory.foodList.map(
            (foodElement) {
              return Container(
                height: availableSize *
                    ((100 / mealCategory.foodList.length) / 100 - 0.01),
                margin: EdgeInsets.only(left: 10, right: 10),
                child: MealItem(foodElement),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
