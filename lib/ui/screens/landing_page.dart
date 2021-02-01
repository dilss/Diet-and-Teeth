import 'package:diet_and_teeth_app/core/services/auth.dart';
import 'package:diet_and_teeth_app/ui/screens/email_sign_in_page.dart';
import 'package:diet_and_teeth_app/ui/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
        stream: auth.authStateChanges(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.active) {
            final User user = userSnapshot.data;
            if (user == null) {
              return EmailSignInPage();
            }
            return HomeScreen();
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
