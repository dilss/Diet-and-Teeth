import 'package:cloud_firestore/cloud_firestore.dart';

import 'food_item_category_enum.dart';
import 'meal_category_enum.dart';

import 'food_item_data_model.dart';

class DaylyDiet {
  String date;
  List<FoodItemDataModel> _foodList = [];
  String id;

  DaylyDiet({this.date});

  List<FoodItemDataModel> get items {
    return [..._foodList];
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

  static DaylyDiet fromMap(Map snapshot, String id) {
    var daylyDiet = DaylyDiet(date: snapshot['date']);
    daylyDiet.id = id;
    var daylyDietDocuments =
        FirebaseFirestore.instance.collection(id).doc().snapshots();
    daylyDietDocuments.forEach(
      (element) {
        daylyDiet.addItem(
          FoodItemDataModel.fromMap(element.data(), element.id),
        );
      },
    );
    return daylyDiet;
  }

  Map<dynamic, dynamic> toJson() {
    Map json;
    json['id'] = this.id;
    json['date'] = this.date;

    this.items.forEach(
      (element) {
        json[element.id] = element.toJson();
      },
    );
    return json;
  }
}
