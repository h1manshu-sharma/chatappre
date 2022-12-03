import 'dart:developer';

import 'package:chatapp/logic/services/image_services.dart';
import 'package:chatapp/presentation/constants/constants.dart';
import 'package:chatapp/presentation/helpers/validators.dart';
import 'package:chatapp/presentation/screens/account%20creation/providers/complete_profile_provider.dart';
import 'package:chatapp/presentation/widgets/gap_widget.dart';
import 'package:chatapp/presentation/widgets/pageScaffold.dart';
import 'package:chatapp/presentation/widgets/primary_button.dart';
import 'package:chatapp/presentation/widgets/primary_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CompleteProfileProvider>(context);
    return PageScaffold(
      appBar: AppBar(
        title: Text("Complete Profile"),
      ),
      body: SafeArea(
          child: Form(
        key: controller.formKey,
        child: ListView(
          padding: Insets.pagePadding,
          children: [
            Center(
              child: CupertinoButton(
                onPressed: () {
                  ImageServices.showPhotoOptions(
                      onImagePicked: controller.onImagePicked);
                },
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: CustomColors.inactive,
                  backgroundImage: (controller.profilePicture != null)
                      ? FileImage(controller.profilePicture!)
                      : null,
                ),
              ),
            ),
            GapWidget(),
            PrimaryTextField(
              label: "Full Name",
              controller: controller.fullNameController,
              enabled: !controller.isLoading,
              validator: Validators.nameValidator,
            ),
            GapWidget(),
            PrimaryTextField(
              label: "Bio",
              controller: controller.bioController,
              enabled: !controller.isLoading,
            ),
            GapWidget(),
            PrimaryButton(
              text: "Continue",
              onPressed: controller.saveDetails,
              isLoading: controller.isLoading,
            ),
          ],
        ),
      )),
    );
  }
}
