import 'package:flutter/foundation.dart';

enum UserRoleEnum { regular, admin }

class UserData {
  final String username;
  final String email;
  final UserRoleEnum userRoleEnum;

  UserData({
    @required this.username,
    @required this.email,
    @required this.userRoleEnum,
  });

  factory UserData.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    final username = data['username'] as String;
    final email = data['email'] as String;
    final userRoleEnum = UserRoleEnum.values[data['userRole'] as int];
    return UserData(
      username: username,
      email: email,
      userRoleEnum: userRoleEnum,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "email": email,
      "userRole": userRoleEnum.index,
    };
  }
}
