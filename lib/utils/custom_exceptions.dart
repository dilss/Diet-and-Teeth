enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  weakPassword,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  networkRequestFailed,
  undefined,
}

class AuthExceptionHandler {
  static handleException(e) {
    var status;
    switch (e.code) {
      case "invalid-email":
        status = AuthResultStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthResultStatus.wrongPassword;
        break;
      case "weak-password":
        status = AuthResultStatus.weakPassword;
        break;
      case "user-not-found":
        status = AuthResultStatus.userNotFound;
        break;
      case "user-disabled":
        status = AuthResultStatus.userDisabled;
        break;
      case "too-many-requests":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "operation-not-allowed":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "email-already-in-use":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      case "network-request-failed":
        status = AuthResultStatus.networkRequestFailed;
        break;
      default:
        status = AuthResultStatus.undefined;
    }
    return status;
  }

  static generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage = "Email mal formatado.";
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = "Senha incorreta.";
        break;
      case AuthResultStatus.weakPassword:
        errorMessage = "Senha fraca.";
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = "Usuário não encontrado.";
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = "Conta desabilitada.";
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage = "Excesso de tentativas, tente mais tarde.";
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = "Inscrição com email e senha não habilitada.";
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage = "Uma conta com este email já existe.";
        break;
      case AuthResultStatus.networkRequestFailed:
        errorMessage = "Sem conexão com a internet.";
        break;
      default:
        errorMessage = "Um erro desconhecido ocorreu.";
    }
    return errorMessage;
  }
}
