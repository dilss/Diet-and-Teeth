import 'package:diet_and_teeth_app/diets_dashboard/ui/tabs_screen.dart';
import 'package:diet_and_teeth_app/home_screen.dart';
import 'package:diet_and_teeth_app/info_screen.dart';
import 'package:diet_and_teeth_app/landing_page.dart';
import 'package:diet_and_teeth_app/medicines_dashboard/medicine_screen.dart';
import 'package:diet_and_teeth_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:connectivity/connectivity.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthBase>(
          create: (context) => Auth(),
        ),
        Provider<Connectivity>(
          create: (context) => Connectivity(),
        ),
      ],
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
        },
      ),
    );
  }
}
