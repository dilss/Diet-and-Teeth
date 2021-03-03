import 'package:diet_and_teeth_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  final String title;

  const LogoutConfirmationDialog({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthBase>(context, listen: false);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(title),
      actions: [
        FlatButton(
          child: Text('Sim'),
          onPressed: () {
            _auth.signOut();
            Navigator.of(context).pop(true);
          },
        ),
        FlatButton(
          child: Text('Não'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
