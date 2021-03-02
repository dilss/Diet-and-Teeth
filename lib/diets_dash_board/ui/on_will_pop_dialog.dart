import 'package:diet_and_teeth_app/utils/const_data.dart';
import 'package:flutter/material.dart';

class OnWillPopDialog extends StatelessWidget {
  final String title;

  const OnWillPopDialog({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(title),
      actions: [
        FlatButton(
          child: Text('Sim'),
          onPressed: () {
            ConstData.resetSelectedItems();
            //inser clear diet code here
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
