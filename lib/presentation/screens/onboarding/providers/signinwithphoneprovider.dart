import 'dart:developer';

import 'package:chatapp/app.dart';
import 'package:chatapp/logic/services/auth_services.dart';
import 'package:chatapp/presentation/constants/constants.dart';
import 'package:chatapp/presentation/widgets/gap_widget.dart';
import 'package:chatapp/presentation/widgets/otp_dialog.dart';
import 'package:chatapp/presentation/widgets/primary_button.dart';
import 'package:chatapp/presentation/widgets/primary_textfield.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInWithPhoneProvider extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController phoneController = TextEditingController();
  String selectedCountry = "+91";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void pickCountryCode() {
    showCountryPicker(
        context: navigatorKey.currentState!.context,
        showPhoneCode: true,
        onSelect: (country) {
          selectedCountry = "+" + country.phoneCode;
          notifyListeners();
        });
  }

  void sendOTP() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    String phoneNumber = phoneController.text.trim();

    try {
      AuthServices.sendOTP(selectedCountry + phoneNumber,
          codeSent: (verificationId, token) {
        showVerifyOtpDialog(verificationId);
      }, verificationFailed: (ex) {
        showSnackbar(ex.message.toString());
      }, verificationCompleted: (credential) {});
    } on FirebaseAuthException catch (e) {
      showSnackbar(e.message.toString());
    }
  }

  void showVerifyOtpDialog(String verificationId) {
    showDialog(
        barrierDismissible: false,
        context: navigatorKey.currentState!.context,
        builder: (context) {
          return OtpDialog(
            verificationId: verificationId,
          );
        });
  }
}
