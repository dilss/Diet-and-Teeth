import 'package:flutter/material.dart';

import 'food_type.dart';

enum MealCategoryEnum {
  breakfast,
  lunch,
  afternoonSnack,
  dinner,
  miscelaneous,
}

class MealCategory {
  final MealCategoryEnum category;
  final String title;
  final String imageUri;
  final Color color;
  final List<FoodType> foodList;

  MealCategory({
    @required this.category,
    @required this.title,
    this.imageUri,
    @required this.foodList,
    this.color,
  });
}
