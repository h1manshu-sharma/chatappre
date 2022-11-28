import 'package:chatapp/app.dart';
import 'package:chatapp/presentation/constants/constants.dart';
import 'package:chatapp/presentation/helpers/validators.dart';
import 'package:chatapp/presentation/screens/onboarding/providers/signupwithemailprovider.dart';
import 'package:chatapp/presentation/widgets/gap_widget.dart';
import 'package:chatapp/presentation/widgets/pageScaffold.dart';
import 'package:chatapp/presentation/widgets/primary_button.dart';
import 'package:chatapp/presentation/widgets/primary_textfield.dart';
import 'package:chatapp/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpWithEmail extends StatefulWidget {
  const SignUpWithEmail({super.key});

  @override
  State<SignUpWithEmail> createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<SignUpWithEmail> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SignUpWithEmailProvider>(context);

    return PageScaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: SafeArea(
          child: Form(
        key: controller.formKey,
        child: ListView(
          padding: Insets.pagePadding,
          children: [
            PrimaryTextField(
              label: "Email Address",
              controller: controller.emailController,
              validator: Validators.emailValidator,
              enabled: !controller.isLoading,
            ),
            GapWidget(),
            PrimaryTextField(
              controller: controller.passWordController,
              label: "Password",
              obscureText: true,
              validator: Validators.passwordValidator,
              enabled: !controller.isLoading,
            ),
            GapWidget(),
            PrimaryTextField(
              label: "Confirm Password",
              obscureText: true,
              controller: controller.cpassWordController,
              validator: controller.cpasswordValidator,
              enabled: !controller.isLoading,
            ),
            GapWidget(),
            PrimaryButton(
              text: "Sign Up",
              onPressed: () {
                controller.createAccount();
              },
              isLoading: controller.isLoading,
            ),
            GapWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Alreadt have an account?",
                  style: TextStyles.smallBodyText,
                ),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text("Sign In"),
                    onPressed: () {
                      goBack();
                    })
              ],
            )
          ],
        ),
      )),
    );
  }
}
