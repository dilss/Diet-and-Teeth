import 'package:diet_and_teeth_app/diets_dash_board/ui/success_check.dart';
import 'package:flutter/material.dart';

class SuccessfullySavedDialog extends StatelessWidget {
  const SuccessfullySavedDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        SuccessCheckMark(),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(
        'Salvo com sucesso!',
        style: TextStyle(fontSize: 22),
        textAlign: TextAlign.center,
      ),
    );
  }
}
