import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

import '../models/data_models/food_item_data_model.dart';

class DaylyDietProvider with ChangeNotifier {
  DateTime date;
  List<FoodItemDataModel> _foodList;
  String uuid;

  DaylyDietProvider({this.date}) {
    uuid = Uuid().v1();
  }

  var _harmfulPotential = 0;

  void addItem(FoodItemDataModel item) {
    _foodList.add(item);
  }

  bool removeItem(FoodItemDataModel item) {
    return _foodList.remove(item);
  }

  int get harmfulPotential {
    _foodList.forEach((element) {
      _harmfulPotential += element.howMuchHarmful;
    });
    return _harmfulPotential;
  }
}
