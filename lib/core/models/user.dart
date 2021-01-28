import 'package:flutter/foundation.dart';

enum UserRoleEnum { regular, admin }

class User {
  final String name;
  final String email;
  final String userId;
  final UserRoleEnum userRoleEnum;

  User({
    @required this.name,
    @required this.email,
    @required this.userId,
    @required this.userRoleEnum,
  });

  factory User.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    final name = data['name'] as String;
    final email = data['email'] as String;
    final userId = data['userId'] as String;
    final userRoleEnum = UserRoleEnum.values[data['userRoleEnum'] as int];
    return User(
      name: name,
      email: email,
      userId: userId,
      userRoleEnum: userRoleEnum,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "userId": userId,
      "userRoleEnum": userRoleEnum.index,
    };
  }
}
