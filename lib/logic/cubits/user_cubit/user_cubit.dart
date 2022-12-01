import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chatapp/data/models/repositories/user_repository.dart';
import 'package:chatapp/logic/cubits/user_cubit/user_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../data/models/user_model.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState()) {
    initialize();
  }

  UserRepository userRepository = UserRepository();

  void handleAuthState(User? user) async {
    if (user != null) {
      UserModel? userModel = await userRepository.fetchUserById(user.uid);
      if (userModel != null) {
        emit(UserLoggedInState(userModel));
      } else {
        UserModel newUser = UserModel.fromFirebaseUser(user);
        await userRepository.saveUser(newUser);
        emit(UserLoggedInState(newUser));
      }
    } else {
      emit(UserLoggedOutState());
    }
  }

  StreamSubscription? _authSubscription;

  void initialize() {
    _authSubscription =
        FirebaseAuth.instance.userChanges().listen(handleAuthState);
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
