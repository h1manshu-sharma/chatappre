import 'package:chatapp/presentation/screens/onboarding/welcome_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "welcome":
        return CupertinoPageRoute(builder: (context) => WelcomeScreen());

      default:
        return null;
    }
  }
}
