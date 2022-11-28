import 'package:chatapp/presentation/screens/account%20creation/complete_profile_screen.dart';
import 'package:chatapp/presentation/screens/account%20creation/providers/complete_profile_provider.dart';
import 'package:chatapp/presentation/screens/onboarding/providers/signinwithemailprovider.dart';
import 'package:chatapp/presentation/screens/onboarding/providers/signupwithemailprovider.dart';
import 'package:chatapp/presentation/screens/onboarding/providers/welcome_provider.dart';
import 'package:chatapp/presentation/screens/onboarding/signinwithemail.dart';
import 'package:chatapp/presentation/screens/onboarding/signinwithphone.dart';
import 'package:chatapp/presentation/screens/onboarding/signupwithemail.dart';
import 'package:chatapp/presentation/screens/onboarding/welcome_screen.dart';
import 'package:chatapp/presentation/screens/others/redirect_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/onboarding/providers/signinwithphoneprovider.dart';

class Routes {
  static const String welcome = "welcome";
  static const String signinwithemail = "signinwithemail";
  static const String signupwithemail = "signupwithemail";
  static const String signinwithphone = "signupwithphone";
  static const String completeprofile1 = "completeprofile1";
  static const String redirectScreen = "redirectScreen";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (context) => WelcomeProvider(),
                child: WelcomeScreen()));

      case signinwithemail:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (context) => SignInWithEmailProvider(),
                child: SignInWithEmailScreen()));

      case signupwithemail:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => SignUpWithEmailProvider(),
                  child: SignUpWithEmail(),
                ));
      case signinwithphone:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => SignInWithPhoneProvider(),
                  child: SignInWithPhone(),
                ));
      case completeprofile1:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => CompleteProfileProvider(),
                  child: CompleteProfileScreen(),
                ));
      case redirectScreen:
        return CupertinoPageRoute(builder: (context) => RedirectScreen());

      default:
        return null;
    }
  }
}
