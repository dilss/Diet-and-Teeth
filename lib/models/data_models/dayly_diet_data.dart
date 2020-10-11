import 'package:uuid/uuid.dart';

import '../types/food_item_category_enum.dart';
import '../types/meal_category_enum.dart';

import 'food_item_data_model.dart';

class DaylyDiet {
  DateTime date;
  List<FoodItemDataModel> _foodList = [];
  String uuid;

  DaylyDiet({this.date}) {
    uuid = Uuid().v1();
  }

  List<FoodItemDataModel> get items {
    return [..._foodList];
  }

  var _harmfulPotential = 0;

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
    _foodList.forEach((element) {
      _harmfulPotential += element.howMuchHarmful;
    });
    return _harmfulPotential;
  }

  void clearData() {
    date = null;
    _foodList.clear();
  }
}
