import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app.dart';

class DialogHelper {
  static void showAlertDialog({
    required String title,
    required String content,
    required String actionText,
    Function()? onActionPressed,
  }) async {
    if (Platform.isIOS) {
      CupertinoAlertDialog cupertinoAlertDialog = CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              onActionPressed!();
              Navigator.pop(navigatorKey.currentState!.context);
            },
            child: Text(actionText),
          ),
        ],
      );

      showCupertinoDialog(
          barrierDismissible: true,
          context: navigatorKey.currentState!.context,
          builder: (context) {
            return cupertinoAlertDialog;
          });
    } else {
      AlertDialog alertDialog = AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              onActionPressed!();

              Navigator.pop(navigatorKey.currentState!.context);
            },
            child: Text(actionText),
          ),
        ],
      );

      showDialog(
          barrierDismissible: true,
          context: navigatorKey.currentState!.context,
          builder: (context) {
            return alertDialog;
          });
    }
  }
}
