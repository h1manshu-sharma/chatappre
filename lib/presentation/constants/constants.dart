import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: CustomColors.accent,
      secondary: CustomColors.accent,
    ),
    appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyles.heading2),
  );
}

class Insets {
  static EdgeInsets pagePadding =
      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10);
}

class TextStyles {
  static TextStyle heading1 =
      TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black);

  static TextStyle heading2 =
      TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black);

  static TextStyle heading3 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);

  static TextStyle bodyText = TextStyle(
      fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black);

  static TextStyle smallBodyText = TextStyle(
      fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black);
}

class CustomColors {
  static Color accent = Color(0xff1ab7c3);
  static Color accentLight = Color.fromARGB(255, 162, 233, 238);
  static Color accentDark = Color.fromARGB(255, 17, 117, 124);

  static Color inactive = Colors.grey[300]!;
  static Color inactiveLight = Colors.grey[200]!;
  static Color inactiveDark = Colors.grey[600]!;
}
