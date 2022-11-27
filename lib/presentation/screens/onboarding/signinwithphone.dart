import 'package:chatapp/presentation/helpers/validators.dart';
import 'package:chatapp/presentation/screens/onboarding/providers/signinwithphoneprovider.dart';
import 'package:chatapp/presentation/widgets/gap_widget.dart';
import 'package:chatapp/presentation/widgets/primary_button.dart';
import 'package:chatapp/presentation/widgets/primary_textfield.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';

class SignInWithPhone extends StatefulWidget {
  const SignInWithPhone({super.key});

  @override
  State<SignInWithPhone> createState() => _SignInWithPhoneState();
}

class _SignInWithPhoneState extends State<SignInWithPhone> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SignInWithPhoneProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in with phone"),
      ),
      body: SafeArea(
          child: Form(
        key: controller.formKey,
        child: ListView(
          padding: Insets.pagePadding,
          children: [
            PrimaryTextField(
              controller: controller.phoneController,
              enabled: !controller.isLoading,
              label: "Phone",
              validator: Validators.phoneValidator,
              prefix: CupertinoButton(
                  child: Text(controller.selectedCountry),
                  onPressed: controller.pickCountryCode),
            ),
            GapWidget(),
            PrimaryButton(
                isLoading: controller.isLoading,
                text: "SignIn",
                onPressed: controller.sendOTP)
          ],
        ),
      )),
    );
  }
}
