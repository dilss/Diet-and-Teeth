import 'package:uuid/uuid.dart';

enum FoodItemCategoryEnum {
  harmlessFood,
  drinksWithSugar,
  breadCookieWithoutSugar,
  ricePastaAndPotato,
  cakeCookieWithSugar,
  dessertWithSugar,
  stickyCandies,
}

enum MealCategoryEnum {
  breakfast,
  lunch,
  afternoonSnack,
  dinner,
  extras,
}

class FoodItem {
  String uuid;
  String title;
  String description;
  String iconPath;
  FoodItemCategoryEnum foodItemCategory;
  MealCategoryEnum mealCategory;

  var isSelected = false;
  var _harmfullPotential = 0;

  FoodItem({
    this.mealCategory,
    this.foodItemCategory,
    this.iconPath,
    this.title,
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

class DaylyDiet {
  DateTime date;
  List<FoodItem> _foodList;

  DaylyDiet({this.date});

  var _harmfulPotential = 0;

  void addItem(FoodItem item) {
    _foodList.add(item);
  }

  bool removeItem(FoodItem item) {
    return _foodList.remove(item);
  }

  int get harmfulPotential {
    _foodList.forEach((element) {
      _harmfulPotential += element.howMuchHarmful;
    });
    return _harmfulPotential;
  }
}
