import 'food_item_category_enum.dart';
import 'meal_category_enum.dart';

import 'food_item_data_model.dart';

class DailyDiet {
  String date;
  List<FoodItemDataModel> foodList = [];

  DailyDiet({this.date});

  List<FoodItemDataModel> get items {
    return [...foodList];
  }

  String get dateAsId {
    return date.replaceAll(RegExp(r'/'), '-');
  }

  void addItem(FoodItemDataModel item) {
    foodList.add(item);
  }

  void removeItem(
      MealCategoryEnum mealCategory, FoodItemCategoryEnum foodCategory) {
    return foodList.removeWhere(
      (element) => (element.mealCategory == mealCategory &&
          element.foodItemCategory == foodCategory),
    );
  }

  int get harmfulPotential {
    var _harmfulPotential = 0;
    foodList.forEach((element) {
      _harmfulPotential += element.howMuchHarmful;
    });
    return _harmfulPotential;
  }

  int howManyItemsForMeal(MealCategoryEnum category) {
    int itemsCounter = 0;
    foodList.forEach((element) {
      if (element.mealCategory == category) {
        itemsCounter++;
      }
    });
    return itemsCounter;
  }

  void clearData() {
    date = null;
    foodList.clear();
  }

  factory DailyDiet.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    final date = data['date'] as String;
    DailyDiet diet = DailyDiet(date: date);

    if (data['food_list'] != null) {
      var foodItemsJson = data['food_list'] as List;
      var foodList = foodItemsJson
          .map((foodItemJson) => FoodItemDataModel.fromMap(foodItemJson))
          .toList();
      diet.foodList = foodList;
    }
    return diet;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> json = {};
    json['date'] = date;
    var temp = [];
    this.items.forEach(
      (element) {
        temp.add(
          element.toMap(),
        );
      },
    );
    json['food_list'] = temp;
    return json;
  }
}
