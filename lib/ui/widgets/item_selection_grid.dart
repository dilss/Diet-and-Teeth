import 'package:diet_and_teeth_app/core/models/meal_category_enum.dart';
import 'package:diet_and_teeth_app/core/viewmodels/food_item_widget_model.dart';
import 'package:flutter/material.dart';

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
