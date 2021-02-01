import 'package:diet_and_teeth_app/ui/widgets/auth/email_sign_in_form.dart';
import 'package:flutter/material.dart';

class EmailSignInPage extends StatefulWidget {
  @override
  _EmailSignInPageState createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: EmailSignInForm.create(context),
    );
  }
}
