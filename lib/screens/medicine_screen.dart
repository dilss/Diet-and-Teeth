import 'package:flutter/material.dart';

class MedicineScreen extends StatelessWidget {
  static const routeName = '/medicine';
  @override
  Widget build(BuildContext context) {
    final myAppBar = AppBar(
      title: Text('Medicamentos'),
    );
    final mediaQuery = MediaQuery.of(context);
    final availableSize = mediaQuery.size.height -
        mediaQuery.padding.top -
        myAppBar.preferredSize.height;
    return Scaffold(
      appBar: myAppBar,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: availableSize * 0.01),
            Container(
              height: availableSize * 0.38,
              child: Card(
                elevation: 8,
                shadowColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            SizedBox(height: availableSize * 0.01),
            Container(
              height: availableSize * 0.6,
              child: Card(
                elevation: 8,
                shadowColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListView(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
