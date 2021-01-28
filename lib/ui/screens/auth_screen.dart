import 'package:diet_and_teeth_app/core/models/user.dart' as customUser;
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

        final newUser = customUser.User(
          name: username,
          email: email,
          userId: userCredential.user.uid,
          userRoleEnum: customUser.UserRoleEnum.regular,
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user.uid)
            .set(
              newUser.toMap(),
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
      backgroundColor: Theme.of(context).backgroundColor,
      body: AuthForm(_submitAuthForm, _isLoading),
    );
  }
}
