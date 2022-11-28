import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void goTo(String routeName) {
  Navigator.pushNamed(navigatorKey.currentState!.context, routeName);
}

void goBack() {
  Navigator.pop(navigatorKey.currentState!.context);
}

void goToReplacement(String routeName) {
  Navigator.pushReplacementNamed(navigatorKey.currentState!.context, routeName);
}

void closeAllAndGoTo(String routeName) {
  Navigator.popUntil(navigatorKey.currentContext!, (route) => route.isFirst);
  Navigator.pushReplacementNamed(navigatorKey.currentContext!, routeName);
}

void showSnackbar(String content,
    {Color backgroundColor = Colors.red,
    Duration duration = const Duration(seconds: 3)}) {
  ScaffoldMessenger.of(navigatorKey.currentState!.context)
      .showSnackBar(SnackBar(
    content: Text(content),
    backgroundColor: backgroundColor,
    duration: duration,
  ));
}
