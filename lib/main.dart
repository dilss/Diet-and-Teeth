import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'screens/home_screen.dart';
import 'screens/diet_settings_screen.dart';
import 'screens/item_selection_screen.dart';
import 'screens/medicine_screen.dart';
import 'screens/info_screen.dart';
import 'screens/auth_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diet and Teeth',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        backgroundColor: Colors.white,
        accentColor: Colors.cyan,
        accentColorBrightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Quicksand',
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.cyan,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.hasData) {
            return HomePage();
          }
          return AuthScreen();
        },
      ),
      routes: {
        DietSettingsScreen.routeName: (context) => DietSettingsScreen(),
        ItemSelectionScreen.routeName: (context) => ItemSelectionScreen(),
        MedicineScreen.routeName: (context) => MedicineScreen(),
        InfoScreen.routeName: (context) => InfoScreen(),
      },
    );
  }
}
