import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';
import 'screens/medicine_screen.dart';
import 'screens/info_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/succesfully_saved_screen.dart';
import 'providers/diets_list_provider.dart';

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
        ChangeNotifierProvider(
          create: (ctx) => DietsList(),
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
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData) {
              return HomeScreen();
            }
            return AuthScreen();
          },
        ),
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
