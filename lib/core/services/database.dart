import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_and_teeth_app/core/models/daily_diet_data.dart';
import 'package:diet_and_teeth_app/core/services/api_path.dart';
import 'package:flutter/foundation.dart';

abstract class Database {
  Future<void> setDiet(DailyDiet dietData);
  Future<void> deleteDiet(DailyDiet dietData);
  Stream<List<DailyDiet>> dietsStream();
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  Future<void> setDiet(DailyDiet dietData) async => await setData(
        data: dietData.toMap(),
        path: APIPath.diet(uid, dietData.dateAsId),
      );

  Future<void> deleteDiet(DailyDiet dietData) async => await deleteData(
        path: APIPath.diet(uid, dietData.dateAsId),
      );

  Future<void> setData({String path, Map<String, dynamic> data}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.set(data);
  }

  Future<void> deleteData({String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.delete();
  }

  Stream<List<DailyDiet>> dietsStream() {
    final path = APIPath.diets(uid);
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();
    return snapshots.map(
      (snapshot) => snapshot.docs
          .map(
            (snapshot) => DailyDiet.fromMap(snapshot.data()),
          )
          .toList(),
    );
  }
}