import 'package:flutter/material.dart';
import '../widgets/success_check.dart';

class SuccessfullySavedScreen extends StatelessWidget {
  static const routeName = '/successfully-saved-screen';
  @override
  Widget build(BuildContext context) {
    final availableSize =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        height: availableSize,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Salvo com sucesso!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SuccessCheckMark(),
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
