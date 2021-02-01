import 'package:diet_and_teeth_app/core/services/auth.dart';
import 'package:diet_and_teeth_app/ui/screens/home_screen.dart';
import 'package:diet_and_teeth_app/ui/screens/info_screen.dart';
import 'package:diet_and_teeth_app/ui/screens/landing_page.dart';
import 'package:diet_and_teeth_app/ui/screens/medicine_screen.dart';
import 'package:diet_and_teeth_app/ui/screens/succesfully_saved_screen.dart';
import 'package:diet_and_teeth_app/ui/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diet and Teeth',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          primaryColor: Colors.cyan,
          backgroundColor: Colors.white,
          accentColor: Colors.cyan,
          accentColorBrightness: Brightness.dark,
          appBarTheme: AppBarTheme(
            color: Colors.cyan[100],
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Quicksand',
          buttonTheme: ButtonTheme.of(context).copyWith(
            buttonColor: Colors.cyan,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          bottomSheetTheme: BottomSheetThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.cyan[100],
            selectedLabelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            type: BottomNavigationBarType.fixed,
          ),
        ),
        home: LandingPage(),
        routes: {
          MedicineScreen.routeName: (context) => MedicineScreen(),
          InfoScreen.routeName: (context) => InfoScreen(),
          TabsScreen.routeName: (context) => TabsScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          SuccessfullySavedScreen.routeName: (context) =>
              SuccessfullySavedScreen(),
        },
      ),
    );
  }
}
