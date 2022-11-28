import 'package:chatapp/app.dart';
import 'package:chatapp/presentation/constants/constants.dart';
import 'package:chatapp/presentation/helpers/validators.dart';
import 'package:chatapp/presentation/screens/onboarding/providers/signinwithemailprovider.dart';
import 'package:chatapp/presentation/widgets/gap_widget.dart';
import 'package:chatapp/presentation/widgets/pageScaffold.dart';
import 'package:chatapp/presentation/widgets/primary_button.dart';
import 'package:chatapp/presentation/widgets/primary_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../routes.dart';

class SignInWithEmailScreen extends StatefulWidget {
  const SignInWithEmailScreen({super.key});

  @override
  State<SignInWithEmailScreen> createState() => _SignInWithEmailScreenState();
}

class _SignInWithEmailScreenState extends State<SignInWithEmailScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SignInWithEmailProvider>(context);
    return PageScaffold(
      appBar: AppBar(
        title: Text("Sign In"),
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
              enabled: !controller.isLoading,
              validator: Validators.emailValidator,
            ),
            GapWidget(),
            PrimaryTextField(
              controller: controller.passWordController,
              validator: Validators.passwordValidator,
              label: "Password",
              enabled: !controller.isLoading,
              obscureText: true,
            ),
            GapWidget(),
            PrimaryButton(
              text: "Login",
              onPressed: controller.signIn,
              isLoading: controller.isLoading,
            ),
            GapWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Account Not Created?",
                  style: TextStyles.smallBodyText,
                ),
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text("Sign Out"),
                    onPressed: () {
                      goTo(Routes.signupwithemail);
                    })
              ],
            )
          ],
        ),
      )),
    );
  }
}
