import 'package:diet_and_teeth_app/diets_dash_board/models/food_item_category_enum.dart';
import 'package:diet_and_teeth_app/diets_dash_board/models/meal_category_enum.dart';
import 'package:flutter/foundation.dart';

class FoodItemWidgetModel {
  String id;
  String title;
  String iconPath;
  FoodItemCategoryEnum foodItemCategory;
  MealCategoryEnum mealCategory;

  var isSelected = false;

  FoodItemWidgetModel({
    @required this.id,
    @required this.mealCategory,
    @required this.foodItemCategory,
    @required this.iconPath,
    @required this.title,
  });
}
