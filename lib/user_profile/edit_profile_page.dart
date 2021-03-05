import 'package:diet_and_teeth_app/services/auth.dart';
import 'package:diet_and_teeth_app/services/database.dart';
import 'package:diet_and_teeth_app/user_profile/profile_info_widget.dart';
import 'package:diet_and_teeth_app/user_profile/user_profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  Future<void> settupUserProfile(BuildContext context,
      {Database database, User user}) async {
    try {
      final exits = await database.userAlreadyCreated();
      if (!exits) {
        await database.storeUserData(user: user);
      }
    } catch (e) {
      print(
          "==================Error setting up the user profile ============================");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _database = Provider.of<Database>(context, listen: false);
    final _user = Provider.of<AuthBase>(context, listen: false).currentUser;
    settupUserProfile(context, database: _database, user: _user);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Perfil",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontFamily: 'KidsHandwriting',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: FlatButton(
              splashColor: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Editar',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Icon(
                    Icons.edit_rounded,
                    color: Colors.black,
                  ),
                ],
              ),
              onPressed: () => showDialog(
                context: context,
                child: Container(),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<UserProfileModel>(
          // Here we'll wait for the two futures to resolve before building our widget
          future: settupUserProfile(context, database: _database, user: _user)
              .then((_) => _database.getUserProfile()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(snapshot.error.toString()),
                ),
              );
            }
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return ProfileInfoWidget(model: snapshot.data);
                break;
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.none:
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.sentiment_neutral),
                      Text("Aguardando conexão..."),
                    ],
                  ),
                );
                break;
              default:
                return Container();
                break;
            }
          }),
    );
  }
}
