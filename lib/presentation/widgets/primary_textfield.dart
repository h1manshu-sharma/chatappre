import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryTextField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool? enabled;

  const PrimaryTextField({
    super.key,
    required this.label,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.validator,
    this.enabled,
  });

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  bool hideText = false;
  @override
  void initState() {
    if (widget.obscureText == true) {
      hideText = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      validator: widget.validator,
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: hideText,
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(),
        suffix: widget.obscureText == true
            ? GestureDetector(
                child: Icon(hideText == true
                    ? CupertinoIcons.eye_fill
                    : CupertinoIcons.eye_slash),
                onTap: () {
                  setState(() {
                    hideText = !hideText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
