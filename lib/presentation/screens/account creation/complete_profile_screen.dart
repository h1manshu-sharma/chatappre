import 'package:chatapp/presentation/constants/constants.dart';
import 'package:chatapp/presentation/widgets/gap_widget.dart';
import 'package:chatapp/presentation/widgets/pageScaffold.dart';
import 'package:chatapp/presentation/widgets/primary_button.dart';
import 'package:chatapp/presentation/widgets/primary_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      appBar: AppBar(
        title: Text("Complete Profile"),
      ),
      body: SafeArea(
          child: ListView(
        padding: Insets.pagePadding,
        children: [
          Center(
            child: CupertinoButton(
              onPressed: () {},
              child: CircleAvatar(
                radius: 60,
                backgroundColor: CustomColors.inactive,
              ),
            ),
          ),
          GapWidget(),
          PrimaryTextField(label: "Full Name"),
          GapWidget(),
          PrimaryTextField(label: "Bio"),
          GapWidget(),
          PrimaryButton(text: "Continue", onPressed: () {}),
        ],
      )),
    );
  }
}
