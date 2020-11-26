import 'food_item_category_enum.dart';
import 'meal_category_enum.dart';

class FoodItemDataModel {
  String id;
  String description;
  String title;
  FoodItemCategoryEnum foodItemCategory;
  MealCategoryEnum mealCategory;

  var _harmfullPotential = 0;

  FoodItemDataModel({
    this.id,
    this.mealCategory,
    this.foodItemCategory,
    this.title,
    this.description,
  });

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

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "description": this.description,
      "title": this.title,
      "mealCategory": this.mealCategory.index,
      "foodItemCategory": this.foodItemCategory.index,
    };
  }
}
