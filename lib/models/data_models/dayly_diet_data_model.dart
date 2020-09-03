import 'food_item_data_model.dart';

class DaylyDiet {
  DateTime date;
  List<FoodItemDataModel> _foodList;

  DaylyDiet({this.date});

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
