import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void goTo(String routeName) {
  Navigator.pushNamed(navigatorKey.currentState!.context, routeName);
}

void goBack() {
  Navigator.pop(navigatorKey.currentState!.context);
}
