import 'package:flutter/material.dart';
import '../../core/viewmodels/food_item_widget_model.dart';
import '../../core/models/meal_category_enum.dart';

import 'food_item_widget.dart';

class ItemSelectionGrid extends StatelessWidget {
  final MealCategoryEnum mealCategory;
  final List<FoodItemWidgetModel> foodItemList;

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