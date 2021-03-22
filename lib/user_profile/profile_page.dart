import 'package:diet_and_teeth_app/general_use_widgets/waiting_connection_widget.dart';
import 'package:diet_and_teeth_app/services/auth.dart';
import 'package:diet_and_teeth_app/services/database.dart';
import 'package:diet_and_teeth_app/services/storage.dart';
import 'package:diet_and_teeth_app/user_profile/profile_edit_page.dart';
import 'package:diet_and_teeth_app/user_profile/profile_info_widget.dart';
import 'package:diet_and_teeth_app/user_profile/user_profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final _database = Provider.of<Database>(context, listen: false);
    final _storage = Provider.of<StorageBase>(context, listen: false);
    final _user = Provider.of<AuthBase>(context, listen: false).currentUser;
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
              onPressed: () => Navigator.of(context)
                  .push(
                    MaterialPageRoute(
                      builder: (context) => MultiProvider(
                        providers: [
                          Provider<Database>.value(
                            value: _database,
                          ),
                          Provider<StorageBase>.value(
                            value: _storage,
                          ),
                        ],
                        child: ProfileEditPage(),
                      ),
                    ),
                  )
                  .then(
                    // When poping back to this page we need that it rebuilds itself, this is
                    // the reason for this 'then' block. It executes after we pop back to this page,
                    // and when we do, a simple call to setState gets the job done.
                    (value) => setState(() {}),
                  ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<UserProfileModel>(
          // Here we'll wait for the two futures to resolve before building our widget
          future: _database.getUserProfile(),
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
                return WaitingConnectionWidget();
                break;
              default:
                return Container();
                break;
            }
          }),
    );
  }
}
