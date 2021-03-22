import 'package:diet_and_teeth_app/admin_dashboard/patient_details_page.dart';
import 'package:diet_and_teeth_app/services/database.dart';
import 'package:diet_and_teeth_app/user_profile/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientItemListWidget extends StatelessWidget {
  final UserProfileModel model;

  const PatientItemListWidget({Key key, @required this.model})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _color = Theme.of(context).primaryColor;
    final _database = Provider.of<Database>(context, listen: false);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      shadowColor: _color,
      margin: EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MultiProvider(
              providers: [
                Provider<Database>.value(
                  value: _database,
                ),
              ],
              child: PatientDetailsPage(
                uid: model.uid,
              ),
            ),
          ),
        ),
        focusColor: _color,
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/profile.png'),
          foregroundImage: NetworkImage(model.pictureUrl),
        ),
        title: Text(
          '${model.name} ${model.surname}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${model.email}',
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: _color),
        ),
      ),
    );
  }
}
