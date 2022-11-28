import 'dart:async';

import 'package:chatapp/app.dart';
import 'package:chatapp/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RedirectScreen extends StatefulWidget {
  const RedirectScreen({super.key});

  @override
  State<RedirectScreen> createState() => _RedirectScreenState();
}

class _RedirectScreenState extends State<RedirectScreen> {
  @override
  void goToNextPage() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      closeAllAndGoTo(Routes.completeprofile1);
    } else {
      closeAllAndGoTo(Routes.welcome);
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 500), goToNextPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: CircularProgressIndicator(),
      )),
    );
  }
}
