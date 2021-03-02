import 'dart:async';

import 'package:diet_and_teeth_app/services/database.dart';
import 'package:diet_and_teeth_app/user_profile/user_profile_model.dart';

class UserProfileBloc {
  final Database database;
  UserProfileBloc({this.database});

  StreamController<UserProfileModel> _controller =
      StreamController<UserProfileModel>();

  Stream<UserProfileModel> get modelStream => _controller.stream;
  UserProfileModel _model = UserProfileModel();

  void dispose() {
    _controller.close();
  }

  void updateWith({
    String name,
    String surname,
    String cellPhone,
    String zipCode,
    String address,
    int number,
    String district,
    String city,
    String state,
    String country,
    bool isLoading,
    bool submitted,
    ProfileFormType formType,
  }) {
    //update model
    _model = _model.copyWith(
      name: name,
      surname: surname,
      cellPhone: cellPhone,
      zipCode: zipCode,
      address: address,
      number: number,
      district: district,
      city: city,
      state: state,
      country: country,
      isLoading: isLoading,
      submitted: submitted,
      formType: formType,
    );
    //add updated model to controller
    _controller.add(_model);
  }

  void updateName(String name) {
    updateWith(name: name);
  }

  void updateSurname(String surname) {
    updateWith(surname: surname);
  }

  void updateCellPhone(String cellPhone) {
    updateWith(cellPhone: cellPhone);
  }

  Future<void> createProfile() async {
    updateWith(submitted: true, isLoading: true);
    try {
      await database.setUserProfile(_model);
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> updateProfile() async {
    updateWith(submitted: true, isLoading: true);
    try {
      await database.updateUserProfile(_model);
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

  void toggleFormType() {
    final formType = _model.formType == ProfileFormType.showInfo
        ? ProfileFormType.editInfo
        : ProfileFormType.showInfo;
    updateWith(
      formType: formType,
      isLoading: false,
      submitted: false,
    );
  }
}
