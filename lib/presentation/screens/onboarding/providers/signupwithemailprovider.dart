import 'package:chatapp/app.dart';
import 'package:chatapp/logic/services/auth_services.dart';
import 'package:chatapp/presentation/constants/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpWithEmailProvider extends ChangeNotifier {
  bool isLoading = false;

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController cpassWordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? cpasswordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please confirm your password";
    } else if (passWordController.text.trim() != value.trim()) {
      return "Passwords do not match";
    } else {
      return null;
    }
  }

  void createAccount() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    setLoading(true);

    String email = emailController.text.trim();
    String password = passWordController.text.trim();

    try {
      User? user =
          await AuthServices.createUserWithEmailPassword(email, password);
      if (user != null) {
        showSnackbar("Account Created!", backgroundColor: CustomColors.accent);
      }
    } on FirebaseAuthException catch (e) {
      showSnackbar(e.message.toString());
    }
    setLoading(false);
  }
}
