import 'food_item_category_enum.dart';
import 'meal_category_enum.dart';

import 'food_item_data_model.dart';

class DaylyDiet {
  String date;
  String dateAsId;
  List<FoodItemDataModel> _foodList = [];

  DaylyDiet({this.date});
  List<FoodItemDataModel> get items {
    return [..._foodList];
  }

  void setId() {
    dateAsId = date.replaceAll(RegExp(r'/'), '-');
  }

  void addItem(FoodItemDataModel item) {
    _foodList.add(item);
  }

  void removeItem(
      MealCategoryEnum mealCategory, FoodItemCategoryEnum foodCategory) {
    return _foodList.removeWhere(
      (element) => (element.mealCategory == mealCategory &&
          element.foodItemCategory == foodCategory),
    );
  }

  int get harmfulPotential {
    var _harmfulPotential = 0;
    _foodList.forEach((element) {
      _harmfulPotential += element.howMuchHarmful;
    });
    return _harmfulPotential;
  }

  int howManyItemsForMeal(MealCategoryEnum category) {
    int itemsCounter = 0;
    _foodList.forEach((element) {
      if (element.mealCategory == category) {
        itemsCounter++;
      }
    });
    return itemsCounter;
  }

  void clearData() {
    date = null;
    _foodList.clear();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    setId();
    json['date'] = this.dateAsId;
    var temp = [];
    this.items.forEach(
      (element) {
        temp.add(
          element.toJson(),
        );
      },
    );
    json['food_list'] = temp;
    return json;
  }
}
