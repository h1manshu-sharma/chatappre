import 'dart:developer';

import 'package:chatapp/app.dart';
import 'package:chatapp/logic/services/auth_services.dart';
import 'package:chatapp/presentation/widgets/primary_button.dart';
import 'package:chatapp/presentation/widgets/primary_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'gap_widget.dart';

class OtpDialog extends StatefulWidget {
  final String verificationId;
  const OtpDialog({super.key, required this.verificationId});

  @override
  State<OtpDialog> createState() => _OtpDialogState();
}

class _OtpDialogState extends State<OtpDialog> {
  TextEditingController otpController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void verifyOtp() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      isLoading = true;
    });

    String otp = otpController.text.trim();

    try {
      UserCredential userCredential =
          await AuthServices.verifyOTP(otp, widget.verificationId);

      if (userCredential.user != null) {
        showSnackbar("Signed in");
        goBack();
      }
    } on FirebaseAuthException catch (e) {
      showSnackbar(e.message.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Dialog(
      child: Padding(
        padding: Insets.pagePadding,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PrimaryTextField(
                label: "6-Digit OTP",
                maxLength: 6,
                enabled: !isLoading,
                controller: otpController,
              ),
              GapWidget(),
              PrimaryButton(
                isLoading: isLoading,
                text: "Verify OTP",
                onPressed: () {
                  verifyOtp();
                },
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
