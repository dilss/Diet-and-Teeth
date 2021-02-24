import 'package:diet_and_teeth_app/utils/validators.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInModel with EmailValidator, PasswordValidator {
  final String email;
  final String password;
  final EmailSignInFormType formType;
  final bool isLoading;
  final bool submitted;

  EmailSignInModel({
    this.email = '',
    this.password = '',
    this.formType = EmailSignInFormType.signIn,
    this.isLoading = false,
    this.submitted = false,
  });

  String get primaryButtonText {
    return formType == EmailSignInFormType.signIn ? 'Entrar' : 'Registrar-se';
  }

  String get secondaryButtonText {
    return formType == EmailSignInFormType.signIn
        ? 'Criar uma nova conta'
        : 'Já tenho uma conta';
  }

  bool get validEmail {
    return isEmailValid(email);
  }

  bool get validPassword {
    return isPasswordValid(password);
  }

  EmailSignInModel copyWith({
    String email,
    String password,
    EmailSignInFormType formType,
    bool isLoading,
    bool submitted,
  }) {
    return EmailSignInModel(
      email: email ?? this.email,
      password: password ?? this.password,
      formType: formType ?? this.formType,
      isLoading: isLoading ?? this.isLoading,
      submitted: submitted ?? this.submitted,
    );
  }
}
