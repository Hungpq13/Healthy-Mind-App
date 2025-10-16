class Validators {
  static isValidEmail(String email) {
    final regularExpression =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return regularExpression.hasMatch(email);
  }

  static isValidPassword(String password) {
    password.length >= 6;
    final regularExpression = RegExp(r'^.{6,}$');
    return regularExpression.hasMatch(password);
  }
}
