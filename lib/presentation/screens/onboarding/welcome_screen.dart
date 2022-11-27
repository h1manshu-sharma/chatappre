import 'package:chatapp/app.dart';
import 'package:chatapp/presentation/widgets/gap_widget.dart';
import 'package:chatapp/presentation/widgets/primary_button.dart';
import 'package:chatapp/presentation/widgets/primary_textfield.dart';
import 'package:chatapp/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: Insets.pagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text(
              "Chat App",
              style: TextStyles.heading1,
            ),
            Column(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "By signing in you agree to our ",
                          style: TextStyles.bodyText),
                      WidgetSpan(
                        child: GestureDetector(
                          child: Text(
                            "Terms Of Use",
                            style: TextStyles.bodyText
                                .copyWith(color: Colors.blue),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                GapWidget(),
                PrimaryButton(
                    text: "Continue With Phone",
                    onPressed: () {},
                    iconData: FontAwesomeIcons.phone),
                GapWidget(),
                PrimaryButton(
                  text: "Continue With Google",
                  onPressed: () {
                    goTo(Routes.signinwithemail);
                  },
                  iconData: FontAwesomeIcons.google,
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
