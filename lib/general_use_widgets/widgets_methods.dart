import 'package:diet_and_teeth_app/general_use_widgets/successfully_saved_dialog.dart';
import 'package:flutter/material.dart';

void showCheckSuccessAndPopScreen(BuildContext context,
    {bool popToTheBegining = false}) {
  showDialog(
    context: context,
    useRootNavigator: true,
    barrierDismissible: false,
    builder: (context) => SuccessfullySavedDialog(
      callback: popToTheBegining
          ? () => Navigator.of(context).popUntil((route) => route.isFirst)
          : () {
              // perform exactly two pops, one for the dialog and another for the page
              var count = 0;
              return Navigator.of(context).popUntil((route) => count++ == 2);
            },
    ),
  );
}
