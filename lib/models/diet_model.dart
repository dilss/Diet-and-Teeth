enum FoodItemCategory {
  harmlessFood,
  drinksWithSugar,
  breadCookieWithoutSugar,
  ricePastaAndPotato,
  cakeCookieWithSugar,
  dessertWithSugar,
  stickyCandies,
}

enum MealCategory {
  breakfast,
  lunch,
  afternoonSnack,
  dinner,
  extras,
}

class FoodItem {
  String _name;
  String _description;
  FoodItemCategory foodItemCategory;
  MealCategory mealCategory;

  var _harmfullPotential = 0;

  FoodItem({this.foodItemCategory, this.mealCategory});

  String get name {
    return _name;
  }

  set setName(String name) {
    _name = name;
  }

  String get description {
    return _description;
  }

  set setDescription(String description) {
    _description = description;
  }

  int get howMuchHarmful {
    switch (foodItemCategory) {
      case FoodItemCategory.harmlessFood:
        _harmfullPotential = 0;
        break;
      case FoodItemCategory.drinksWithSugar:
        _harmfullPotential = 1;
        break;
      case FoodItemCategory.breadCookieWithoutSugar:
        _harmfullPotential = 2;
        break;
      case FoodItemCategory.ricePastaAndPotato:
        _harmfullPotential = 2;
        break;
      case FoodItemCategory.dessertWithSugar:
        _harmfullPotential = 3;
        break;
      case FoodItemCategory.cakeCookieWithSugar:
        _harmfullPotential = 4;
        break;
      case FoodItemCategory.stickyCandies:
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
