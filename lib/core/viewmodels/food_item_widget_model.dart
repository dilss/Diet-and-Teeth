import 'package:flutter/foundation.dart';

import '../models/food_item_category_enum.dart';
import '../models/meal_category_enum.dart';

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
