import 'package:diet_and_teeth_app/general_use_widgets/waiting_connection_widget.dart';
import 'package:diet_and_teeth_app/services/database.dart';
import 'package:diet_and_teeth_app/user_profile/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientDetailsPage extends StatelessWidget {
  final String uid;

  const PatientDetailsPage({Key key, @required this.uid}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _database = Provider.of<Database>(context, listen: false);
    return FutureBuilder<UserProfileModel>(
      future: _database.getPatientProfile(patientUid: uid),
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
            return Container(
              child: Center(
                child: Text('${snapshot.data.name}'),
              ),
            );
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
      },
    );
  }
}
