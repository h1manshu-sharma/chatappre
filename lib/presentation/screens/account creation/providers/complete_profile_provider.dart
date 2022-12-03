import 'dart:io';

import 'package:chatapp/app.dart';
import 'package:chatapp/logic/cubits/user_cubit/user_cubit.dart';
import 'package:chatapp/logic/services/image_services.dart';
import 'package:chatapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/user_model.dart';

class CompleteProfileProvider extends ChangeNotifier {
  bool isLoading = false;
  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  File? profilePicture;

  void onImagePicked(File file) {
    profilePicture = file;
    notifyListeners();
  }

  void saveDetails() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    setLoading(true);
    UserModel? currentUser =
        BlocProvider.of<UserCubit>(navigatorKey.currentContext!)
            .getCurrentUser();
    if (currentUser != null) {
      String imageUrl =
          await ImageServices.uploadImage(profilePicture!, "profilePictures");
      currentUser.fullName = fullNameController.text.trim();
      currentUser.bio = bioController.text.trim();
      currentUser.profileProgress = 1;
      currentUser.profilePic = imageUrl;

      BlocProvider.of<UserCubit>(navigatorKey.currentContext!)
          .updateUser(currentUser);

      //go to next page
      closeAllAndGoTo(Routes.home);
    }
    setLoading(false);
  }
}
