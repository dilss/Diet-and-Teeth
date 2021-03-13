import 'package:diet_and_teeth_app/general_use_widgets/success_check.dart';
import 'package:flutter/material.dart';

class SuccessfullySavedDialog extends StatelessWidget {
  final Function callback;
  const SuccessfullySavedDialog({
    Key key,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        SuccessCheckMark(
          callback: callback,
        ),
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
