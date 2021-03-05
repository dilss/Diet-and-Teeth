import 'package:diet_and_teeth_app/services/database.dart';
import 'package:diet_and_teeth_app/user_profile/user_profile_model.dart';

class UserProfileMethods {
  static Future<void> updateProfile(
      {Database database, UserProfileModel profileModel}) async {
    try {
      database.updateUserProfile(profileModel);
    } catch (e) {
      rethrow;
    }
  }
}
