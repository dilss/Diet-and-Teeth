import 'package:flutter/foundation.dart';

enum FoodTypeEnum {
  drinks,
  cereals,
  bread,
  cakeAndCookies,
  eggsAndCheese,
  fruit,
  beansAndSoup,
  meat,
  riceMassAndPotatos,
  vegetables,
  dessert,
  candies,
  salties,
}

class FoodType {
  final String title;
  final FoodTypeEnum type;
  final String imageUri;
  var _wasSelected = false;

  set select(bool value) {
    _wasSelected = value;
  }

  bool get wasSelected {
    return _wasSelected;
  }

  FoodType({
    @required this.type,
    @required this.title,
    @required this.imageUri,
  });
}
