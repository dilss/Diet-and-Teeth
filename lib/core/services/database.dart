import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_and_teeth_app/core/models/user_data.dart';
import 'package:diet_and_teeth_app/core/services/api_path.dart';
import 'package:diet_and_teeth_app/diet_configuration/daily_diet_model.dart';
import 'package:diet_and_teeth_app/user_profile/user_profile_model.dart';
import 'package:flutter/foundation.dart';

abstract class Database {
  Future<void> setDiet(DailyDiet dietData);
  Future<void> deleteDiet(DailyDiet dietData);
  Future<void> setUserProfile(UserProfileModel profileModel);
  Future<void> updateUserProfile(UserProfileModel profileModel);
  Stream<List<DailyDiet>> dietsStream();
  Stream<String> usernameStream();
  Stream<UserRoleEnum> userRoleStream();
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  Future<void> setDiet(DailyDiet dietData) async => await setData(
        data: dietData.toMap(),
        path: APIPath.diet(uid, dietData.dateAsId),
      );

  Future<DailyDiet> getDiet(DailyDiet dietData) async {
    final map = await getData(
      path: APIPath.diet(uid, dietData.dateAsId),
    );
    return DailyDiet.fromMap(map);
  }

  Future<void> deleteDiet(DailyDiet dietData) async => await deleteData(
        path: APIPath.diet(uid, dietData.dateAsId),
      );

  Future<void> setData({String path, Map<String, dynamic> data}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.set(data);
  }

  Future<void> updateData({String path, Map<String, dynamic> data}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.update(data);
  }

  Future<Map<String, dynamic>> getData({String path}) async {
    final map = await FirebaseFirestore.instance.doc(path).get().then(
          (value) => value.data(),
        );
    return map;
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

  Stream<String> usernameStream() {
    final reference = FirebaseFirestore.instance.doc(APIPath.user(uid));
    final snapshots = reference.snapshots();

    return snapshots
        .map((snapshot) => UserData.fromMap(snapshot.data()).username);
  }

  Stream<UserRoleEnum> userRoleStream() {
    final reference = FirebaseFirestore.instance.doc(APIPath.user(uid));
    final snapshots = reference.snapshots();

    return snapshots
        .map((snapshot) => UserData.fromMap(snapshot.data()).userRoleEnum);
  }

  Future<void> setUserName(String firstName) async {
    await updateData(path: APIPath.user(uid), data: {"username": firstName});
  }

  Future<void> setUserRole(UserRoleEnum userRoleEnum) async {
    await updateData(
        path: APIPath.user(uid), data: {"userRole": userRoleEnum.index});
  }

  Future<void> setUserProfile(UserProfileModel profileModel) async {
    await setData(data: profileModel.toJson());
  }

  Future<void> updateUserProfile(UserProfileModel profileModel) async {
    await updateData(data: profileModel.toJson());
  }
}
