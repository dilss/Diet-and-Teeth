import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/main_drawer.dart';
import '../widgets/modal_bottom_sheet_widget.dart';
import '../widgets/dayly_diet_list_widget.dart';
import '../widgets/cario_chart_widget.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  void _startAddingNewDaylyDiet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return ModalBottomSheetWidget();
      },
    );
  }

  final myAppBar = AppBar(
    title: Text(
      'Suas Dietas',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      DropdownButton(
          items: [
            DropdownMenuItem(
              child: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.exit_to_app,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Sair'),
                  ],
                ),
              ),
              value: 'logout',
            ),
          ],
          icon: Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          onChanged: (itemIdentifier) {
            if (itemIdentifier == 'logout') {
              FirebaseAuth.instance.signOut();
            }
          })
    ],
  );

  @override
  Widget build(BuildContext context) {
    final availableSize = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        myAppBar.preferredSize.height;
    return Scaffold(
      appBar: myAppBar,
      drawer: MainDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restaurant),
        onPressed: () {
          _startAddingNewDaylyDiet(context);
        },
      ),
      body: Container(
        height: availableSize,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: availableSize * 0.3,
              child: CarioChartWidget(),
            ),
            SizedBox(
              height: availableSize * 0.01,
            ),
            Container(
              height: availableSize * 0.65,
              child: DaylyDietListWidget(),
            )
          ],
        ),
      ),
    );
  }
}
