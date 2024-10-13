import 'package:email_validator/email_validator.dart';

class Validators {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email is required";
    }
    if (!EmailValidator.validate(email)) {
      return "Enter a valid email";
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password is required";
    }
    if (password.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }
}
