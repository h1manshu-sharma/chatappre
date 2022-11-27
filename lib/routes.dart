import 'package:chatapp/presentation/screens/onboarding/providers/signupwithemailprovider.dart';
import 'package:chatapp/presentation/screens/onboarding/signinwithemail.dart';
import 'package:chatapp/presentation/screens/onboarding/signupwithemail.dart';
import 'package:chatapp/presentation/screens/onboarding/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Routes {
  static const String welcome = "welcome";
  static const String signinwithemail = "signinwithemail";
  static const String signupwithemail = "signupwithemail";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return CupertinoPageRoute(builder: (context) => WelcomeScreen());

      case signinwithemail:
        return CupertinoPageRoute(
            builder: (context) => SignInWithEmailScreen());

      case signupwithemail:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => SignUpWithEmailProvider(),
                  child: SignUpWithEmail(),
                ));

      default:
        return null;
    }
  }
}
