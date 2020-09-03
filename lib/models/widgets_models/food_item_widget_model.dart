import '../types/food_item_category_enum.dart';
import '../types/meal_category_enum.dart';

class FoodItemWidgetModel {
  String title;
  String iconPath;
  FoodItemCategoryEnum foodItemCategory;
  MealCategoryEnum mealCategory;

  var isSelected = false;

  FoodItemWidgetModel({
    this.mealCategory,
    this.foodItemCategory,
    this.iconPath,
    this.title,
  });
}
