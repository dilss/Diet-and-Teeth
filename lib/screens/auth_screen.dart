import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/auth/auth_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;
  String message;

  void _submitAuthForm(
    String email,
    String password,
    String username,
    bool isLogin,
    BuildContext ctx,
  ) async {
    UserCredential userCredential;
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user.uid)
            .set(
          {
            'username': username,
            'email': email,
          },
        );
      }
    } on PlatformException catch (err) {
      setState(() {
        _isLoading = false;
      });
      message = 'Um erro ocorreu, por favor verifique suas credenciais.';
      if (err.message != null) {
        message = err.message;
      }
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(err.message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
      print(err);
    }
    print(userCredential.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[200], //Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm, _isLoading),
    );
  }
}
