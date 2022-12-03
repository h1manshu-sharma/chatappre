import 'package:chatapp/app.dart';
import 'package:chatapp/logic/cubits/user_cubit/user_cubit.dart';

import 'package:chatapp/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirestoreServices.saveData();
  FirebaseAuth.instance.signOut();
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => UserCubit(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        theme: Themes.lightTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: Routes.redirectScreen,
      ),
    );
  }
}
