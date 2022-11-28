import 'package:chatapp/app.dart';
import 'package:chatapp/logic/services/auth_services.dart';
import 'package:chatapp/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WelcomeProvider extends ChangeNotifier {
  bool isLoading = false;
  setLoading(value) {
    isLoading = value;
  }

  void signInWithGoogle() async {
    setLoading(true);
    try {
      UserCredential? userCredential = await AuthServices.signinwithGoogle();

      if (userCredential != null) {
        closeAllAndGoTo(Routes.completeprofile1);
        showSnackbar("Signed in");
      }
    } on FirebaseAuthException catch (e) {
      showSnackbar(e.message.toString());
    }
    setLoading(false);
  }
}
