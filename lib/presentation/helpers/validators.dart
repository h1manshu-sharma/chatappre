import 'package:email_validator/email_validator.dart';

class Validators {
  static String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please Enter a valid email";
    } else if (!EmailValidator.validate(value.trim())) {
      return "Invalid Email Address";
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please Enter a password";
    } else {
      return null;
    }
  }
}
