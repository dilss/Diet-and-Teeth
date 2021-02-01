import 'dart:async';

import 'package:diet_and_teeth_app/core/models/email_sign_in_model.dart';
import 'package:diet_and_teeth_app/core/services/auth.dart';
import 'package:flutter/foundation.dart';

class EmailSignInBloc {
  final AuthBase auth;

  final StreamController<EmailSignInModel> _controller =
      StreamController<EmailSignInModel>();

  EmailSignInBloc({@required this.auth});

  Stream<EmailSignInModel> get modelStream => _controller.stream;
  EmailSignInModel _model = EmailSignInModel();

  void dispose() {
    _controller.close();
  }

  void toggleFormType() {
    final formType = _model.formType == EmailSignInFormType.signIn
        ? EmailSignInFormType.register
        : EmailSignInFormType.signIn;
    updateWith(
      email: '',
      password: '',
      formType: formType,
      isLoading: false,
      submitted: false,
    );
  }

  void updateEmail(String email) => updateWith(email: email);
  void updatePassword(String password) => updateWith(password: password);

  void updateWith({
    String email,
    String password,
    EmailSignInFormType formType,
    bool isLoading,
    bool submitted,
  }) {
    //update model
    _model = _model.copyWith(
      email: email,
      password: password,
      formType: formType,
      isLoading: isLoading,
      submitted: submitted,
    );
    // add updated model to controller
    _controller.add(_model);
  }

  Future<void> submit() async {
    updateWith(submitted: true, isLoading: true);
    try {
      if (_model.formType == EmailSignInFormType.signIn) {
        print('ENTREI AQUI!');
        await auth.signInWithEmailAndPassword(
          email: _model.email,
          password: _model.password,
        );
      } else {
        await auth.createUserWithEmailAndPassword(
          email: _model.email,
          password: _model.password,
        );
      }
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }
}
