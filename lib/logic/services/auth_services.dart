import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  static Future<User?> createUserWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  static Future<User?> signInWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  static Future<void> sendOTP(
    String phoneNumber, {
    required Function(String, int?) codeSent,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(PhoneAuthCredential) verificationCompleted,
  }) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        codeSent: codeSent,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeAutoRetrievalTimeout: ((verificationId) {}),
        timeout: Duration(seconds: 60),
      );
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  static Future<UserCredential> verifyOTP(
      String otp, String verificationId) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  static Future<UserCredential?> signinwithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? signInAccount = await _googleSignIn.signIn();

    if (signInAccount != null) {
      GoogleSignInAuthentication authentication =
          await signInAccount.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken,
      );

      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        throw e;
      }
    } else {
      return null;
    }
  }
}
