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

  factory FoodItemDataModel.fromMap(Map<String, dynamic> data) {
    final id = data['id'] as String;
    final description = data['description'] as String;
    final title = data['title'] as String;
    final mealCategory = MealCategoryEnum.values[data['mealCategory'] as int];
    final foodItemCategory =
        FoodItemCategoryEnum.values[data['foodItemCategory'] as int];
    return FoodItemDataModel(
      id: id,
      title: title,
      foodItemCategory: foodItemCategory,
      mealCategory: mealCategory,
      description: description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "description": description,
      "title": title,
      "mealCategory": mealCategory.index,
      "foodItemCategory": foodItemCategory.index,
    };
  }
}
