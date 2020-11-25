import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

abstract class Database {}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  void createDiet(Map<String, dynamic> dietData) {
    final path = 'users/$uid/diets/diet_001 ';
    final documentReference = FirebaseFirestore.instance.doc(path);
    documentReference.set(dietData);
  }
}
