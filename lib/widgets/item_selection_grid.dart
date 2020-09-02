import 'package:flutter/material.dart';
import '../models/diet_model.dart';

import 'food_item_widget.dart';

class ItemSelectionGrid extends StatelessWidget {
  final MealCategoryEnum mealCategory;
  final List<FoodItem> foodItemList;

  ItemSelectionGrid(this.mealCategory, this.foodItemList);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
        childAspectRatio: 1,
      ),
      children: foodItemList.map(
        (foodElement) {
          return FoodItemWidget(foodElement);
        },
      ).toList(),
    );
  }
}
