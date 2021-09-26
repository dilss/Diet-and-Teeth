import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_and_teeth_app/diets_dashboard/models/daily_diet_model.dart';
import 'package:diet_and_teeth_app/diets_dashboard/models/user_data.dart';
import 'package:diet_and_teeth_app/services/api_path.dart';
import 'package:diet_and_teeth_app/user_profile/user_profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../diets_dashboard/models/daily_diet_model.dart';

abstract class Database {
  Future<void> setDiet(DailyDiet dietData);
  Future<DailyDiet> getDiet(DailyDiet dietData);
  Future<void> deleteDiet(DailyDiet dietData);
  Future<void> updateUserProfile(UserProfileModel profileModel);
  Future<void> setUserRole(UserRoleEnum userRoleEnum);
  Future<UserProfileModel> getUserProfile();
  Future<UserProfileModel> getPatientProfile({@required String patientUid});
  Future<bool> userAlreadyCreated();
  Future<void> storeUserData({User user});
  Future<List<UserProfileModel>> getAllUsersProfiles();
  Stream<List<DailyDiet>> dietsStream();
  Stream<UserRoleEnum> userRoleStream();
  Future<List<DailyDiet>> getAllPatientDiets({@required String patientUid});
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  @override
  Future<void> setDiet(DailyDiet dietData) async => await setData(
        data: dietData.toMap(),
        path: APIPath.diet(uid, dietData.dateAsId),
      );

  @override
  Future<DailyDiet> getDiet(DailyDiet dietData) async {
    final map = await getData(
      path: APIPath.diet(uid, dietData.dateAsId),
    );
    return DailyDiet.fromMap(map);
  }

  @override
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

  @override
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

  @override
  Stream<UserRoleEnum> userRoleStream() {
    final reference = FirebaseFirestore.instance.doc(APIPath.user(uid));
    final snapshots = reference.snapshots();

    return snapshots
        .map((snapshot) => UserData.fromMap(snapshot.data()).userRoleEnum);
  }

  @override
  Future<void> setUserRole(UserRoleEnum userRoleEnum) async {
    await updateData(
        path: APIPath.user(uid), data: {'userRole': userRoleEnum.index});
  }

  @override
  Future<void> updateUserProfile(UserProfileModel profileModel) async {
    await updateData(path: APIPath.user(uid), data: {
      'userProfile.name': profileModel.name,
      'userProfile.surname': profileModel.surname,
      'userProfile.cellPhone': profileModel.cellPhone,
      'userProfile.dateOfBirth': profileModel.dateOfBirth,
      'userProfile.district': profileModel.district,
      'userProfile.city': profileModel.city,
      'userProfile.pictureUrl': profileModel.pictureUrl,
    });
  }

  @override
  Future<UserProfileModel> getUserProfile() async {
    final map = await getData(path: APIPath.user(uid));
    return UserProfileModel.fromJson(map['userProfile']);
  }

  @override
  Future<void> storeUserData({User user}) async {
    await setData(path: APIPath.user(uid), data: {
      'email': user.email,
      'uid': user.uid,
      'userProfile':
          UserProfileModel(email: user.email, uid: user.uid).toJson(),
    });
  }

  @override
  Future<bool> userAlreadyCreated() async {
    final map = await getData(path: APIPath.user(uid));
    return map != null;
  }

  @override
  Future<List<UserProfileModel>> getAllUsersProfiles() async {
    final reference = FirebaseFirestore.instance.collection('users');
    List<UserProfileModel> profiles = [];
    final users = await reference.get();
    users.docs.forEach((element) {
      final map = element.data();
      final profile = UserProfileModel.fromJson(map['userProfile']);
      profiles.add(profile);
    });
    return profiles;
  }

  @override
  Future<UserProfileModel> getPatientProfile(
      {@required String patientUid}) async {
    final reference =
        FirebaseFirestore.instance.collection('users').doc(patientUid);
    final doc = await reference.get();
    final map = doc.data();
    return UserProfileModel.fromJson(map['userProfile']);
  }

  @override
  Future<List<DailyDiet>> getAllPatientDiets(
      {@required String patientUid}) async {
    List<DailyDiet> list = [];
    final reference =
        FirebaseFirestore.instance.collection('users/$patientUid/diets');
    final snapshot = await reference.get();
    final docs = snapshot.docs;
    docs.forEach((element) {
      list.add(DailyDiet.fromMap(element.data()));
    });

    return list;
  }
}
