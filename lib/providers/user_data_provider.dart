import 'package:flutter/material.dart';
import '../models/data_models/dayly_diet_data_model.dart';

class UserDataProvider with ChangeNotifier {
  List<DaylyDiet> _dietsList;

  var userEmail = 'user@default.com';
  var userImageUrl = 'assets/images/placeHolder.png';

  List<DaylyDiet> get items {
    return [..._dietsList];
  }

  void addDaylyDiet(DaylyDiet diet) {
    _dietsList.add(diet);
    notifyListeners();
  }
}
