import 'package:uuid/uuid.dart';

import '../types/food_item_category_enum.dart';
import '../types/meal_category_enum.dart';

class FoodItemDataModel {
  String uuid;
  String description;
  FoodItemCategoryEnum foodItemCategory;
  MealCategoryEnum mealCategory;

  var _harmfullPotential = 0;
  var title = 'untitled';

  FoodItemDataModel({
    this.mealCategory,
    this.foodItemCategory,
  }) {
    uuid = Uuid().v1();
  }

  int get howMuchHarmful {
    switch (foodItemCategory) {
      case FoodItemCategoryEnum.harmlessFood:
        _harmfullPotential = 0;
        break;
      case FoodItemCategoryEnum.drinksWithSugar:
        _harmfullPotential = 1;
        break;
      case FoodItemCategoryEnum.breadCookieWithoutSugar:
        _harmfullPotential = 2;
        break;
      case FoodItemCategoryEnum.ricePastaAndPotato:
        _harmfullPotential = 2;
        break;
      case FoodItemCategoryEnum.dessertWithSugar:
        _harmfullPotential = 3;
        break;
      case FoodItemCategoryEnum.cakeCookieWithSugar:
        _harmfullPotential = 4;
        break;
      case FoodItemCategoryEnum.stickyCandies:
        _harmfullPotential = 5;
        break;
    }
    return _harmfullPotential;
  }
}
