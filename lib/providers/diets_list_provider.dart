import 'package:flutter/material.dart';
import '../models/data_models/dayly_diet_data.dart';

class DietsList with ChangeNotifier {
  final List<DaylyDiet> _dietsList = [];

  List<DaylyDiet> get items {
    return [..._dietsList];
  }

  void addDaylyDiet(DaylyDiet diet) {
    _dietsList.add(diet);
    notifyListeners();
  }

  void removeDaylyDiet(String uuid) {
    _dietsList.removeWhere((element) => element.uuid == uuid);
    notifyListeners();
  }
}
