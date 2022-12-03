import 'dart:async';

import 'package:chatapp/app.dart';
import 'package:chatapp/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubits/user_cubit/user_cubit.dart';
import '../../../logic/cubits/user_cubit/user_state.dart';

class RedirectScreen extends StatefulWidget {
  const RedirectScreen({super.key});

  @override
  State<RedirectScreen> createState() => _RedirectScreenState();
}

class _RedirectScreenState extends State<RedirectScreen> {
  @override
  void goToNextPage(UserState userState) {
    if (userState is UserLoggedInState) {
      if (userState.userModel.profileProgress == 0) {
        closeAllAndGoTo(Routes.completeprofile1);
      } else if (userState.userModel.profileProgress == 1) {
        closeAllAndGoTo(Routes.home);
      }
    } else if (userState is UserLoggedOutState) {
      closeAllAndGoTo(Routes.welcome);
    }
    // User? user = FirebaseAuth.instance.currentUser;
    // if (user != null) {
    //   closeAllAndGoTo(Routes.completeprofile1);
    // } else {
    //   closeAllAndGoTo(Routes.welcome);
    // }
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            goToNextPage(state);
          },
          child: CircularProgressIndicator(),
        ),
      )),
    );
  }
}
