import 'package:flutter/material.dart';

class ConfirmDeletionDialog extends StatelessWidget {
  const ConfirmDeletionDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text('Excluir dieta?'),
      actions: [
        FlatButton(
          child: Text(
            'Não',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.cyan),
          ),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        FlatButton(
          child: Text(
            'Sim',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.cyan),
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        )
      ],
    );
  }
}
