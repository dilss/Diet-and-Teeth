import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/dayly_diet_data.dart';

class DietsList with ChangeNotifier {
  final List<DaylyDiet> _dietsList = [];

  // preencher _dietsList com todas as daylydiets no banco de dados
  // cada daylyDiet tem campos e uma subcolection foodList
  // cada food items tem campos

  // 1 - pegar um snapshot da colection users
  // 2 - pegar current_user_id
  // 3 - query pelo document na collection users usando o current_user_id
  // 4 - na colection diets em cada documento execultar:
  //    1 - pegar a data da dieta
  //    2 - pegar o id da dieta
  //    3 - na colection food_list em cada document execultar:
  //        1 - preencher o campo description
  //        2 - preencher o campo foodItemCategory
  //        3 - preencher o campo foodItemId
  //        4 - preencher o campo harmfullPotential
  //        5 - preencher o campo mealCategory
  //        1 - preencher o campo title

  List<DaylyDiet> get items {
    return [..._dietsList];
  }

  void addDaylyDiet(DaylyDiet diet) {
    _dietsList.add(diet);
    notifyListeners();
  }

  void removeDaylyDiet(String id) {
    _dietsList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  static DietsList fromMap(Map snapshot) {
    DietsList dietsList;
    var id = FirebaseAuth.instance.currentUser.uid;
    var dietsListDocument = FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection('diets')
        .doc()
        .snapshots();
    dietsListDocument.forEach(
      (element) {
        dietsList.addDaylyDiet(
          DaylyDiet.fromMap(element.data(), element.id),
        );
      },
    );
    return dietsList;
  }

  Map toJson() {
    Map json;
    this.items.forEach(
      (element) {
        json[element.id] = element.toJson();
      },
    );
    return json;
  }
}
