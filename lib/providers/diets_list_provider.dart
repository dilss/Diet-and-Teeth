import 'package:flutter/material.dart';
import 'dayly_diet_data_provider.dart';

class DietsListProvider with ChangeNotifier {
  final List<DaylyDietProvider> _dietsList = [
    DaylyDietProvider(date: DateTime.now()),
    DaylyDietProvider(date: DateTime.now()),
  ];

  List<DaylyDietProvider> get items {
    return [..._dietsList];
  }

  void addDaylyDiet(DaylyDietProvider diet) {
    _dietsList.add(diet);
    notifyListeners();
  }
}
