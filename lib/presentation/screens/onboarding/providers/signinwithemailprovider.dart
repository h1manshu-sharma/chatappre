import 'package:bloc/bloc.dart';
import 'package:chatapp/app.dart';
import 'package:chatapp/logic/services/auth_services.dart';
import 'package:chatapp/presentation/screens/account%20creation/complete_profile_screen.dart';
import 'package:chatapp/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInWithEmailProvider extends ChangeNotifier {
  bool isLoading = false;
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void signIn() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    setLoading(true);

    String email = emailController.text.trim();
    String password = passWordController.text.trim();

    try {
      User? user = await AuthServices.signInWithEmailPassword(email, password);
      showSnackbar("Signed In");
      closeAllAndGoTo(Routes.completeprofile1);
    } on FirebaseAuthException catch (e) {
      showSnackbar(e.message.toString());
    }
    setLoading(false);
  }
}
