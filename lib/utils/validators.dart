class EmailValidator {
  bool isEmailValid(String email) => email.isNotEmpty;
  final emailErrorMesssage = 'Campo e-mail deve ser preenchido.';
}

class PasswordValidator {
  String passwordErrorMessage = 'O campo senha deve ser preenchido';
  bool isPasswordValid(String password) => password.isNotEmpty;
}
