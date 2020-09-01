import 'package:flutter/material.dart';
import '../models/diet_model.dart';

class UserDataProvider with ChangeNotifier {
  String _userEmail;
  String _userImageUrl;
  List<DaylyDiet> _dietsList;

  List<DaylyDiet> get items {
    return [..._dietsList];
  }
}
