import 'package:flutter/material.dart';
import '../models/dayly_diet_data.dart';

class DietsList with ChangeNotifier {
  final List<DaylyDiet> _dietsList = [];

  List<DaylyDiet> get items {
    return [..._dietsList];
  }

  void addDaylyDiet(DaylyDiet diet) {
    _dietsList.add(diet);
    notifyListeners();
  }

  void removeDaylyDiet(String date) {
    _dietsList.removeWhere((element) => element.date == date);
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json;
    this.items.forEach(
      (element) {
        json[element.date] = element.toJson();
      },
    );
    return json;
  }
}
