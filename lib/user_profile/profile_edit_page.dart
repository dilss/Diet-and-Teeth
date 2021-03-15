import 'package:diet_and_teeth_app/services/database.dart';
import 'package:diet_and_teeth_app/user_profile/user_profile_edit_form.dart';
import 'package:diet_and_teeth_app/user_profile/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _database = Provider.of<Database>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Editar Perfil',
          style: TextStyle(
              fontFamily: 'KidsHandwriting',
              fontSize: 35,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<UserProfileModel>(
        future: _database.getUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(snapshot.error),
              ),
            );
          }
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return UserProfileEditForm(
                userData: snapshot.data,
              );
              break;
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.active:
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());
              break;
            default:
              return Container();
              break;
          }
        },
      ),
    );
  }
}
