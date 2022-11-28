import 'package:chatapp/presentation/widgets/primary_textfield.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'gap_widget.dart';

class PageScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  const PageScaffold({super.key, required this.body, this.appBar});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(appBar: appBar, body: body),
    );
  }
}
