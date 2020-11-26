import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_and_teeth_app/core/models/dayly_diet_data.dart';
import 'package:diet_and_teeth_app/core/services/api_path.dart';
import 'package:flutter/foundation.dart';

abstract class Database {
  Future<void> createDiet(DaylyDiet dietData);
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  Future<void> createDiet(DaylyDiet dietData) async {
    final path = APIPath.diet(uid, dietData.dateAsId);
    final documentReference = FirebaseFirestore.instance.doc(path);
    await documentReference.set(
      dietData.toJson(),
    );
  }
}
