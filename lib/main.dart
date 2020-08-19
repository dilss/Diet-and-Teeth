import 'package:flutter/material.dart';

import 'screens/diet_settings_screen.dart';
import 'screens/item_selection_screen.dart';
import 'screens/medicine_screen.dart';
import 'widgets/main_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diet and Teeth',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Quicksand',
      ),
      home: HomePage(),
      routes: {
        DietSettingsScreen.routeName: (context) => DietSettingsScreen(),
        ItemSelectionScreen.routeName: (context) => ItemSelectionScreen(),
        MedicineScreen.routeName: (context) => MedicineScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final myAppBar = AppBar(
    title: Text('Página Inicial'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      drawer: MainDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            myAppBar.preferredSize.height,
        child: Center(
          child: RaisedButton(
            child: Text('Prencher refeiçao do dia'),
            onPressed: () {
              Navigator.pushNamed(context, DietSettingsScreen.routeName);
            },
          ),
        ),
      ),
    );
  }
}
