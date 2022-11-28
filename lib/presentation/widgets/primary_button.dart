import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final Function() onPressed;
  final bool isLoading;
  final IconData? iconData;
  final bool? enabled;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.iconData,
    this.enabled,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CupertinoButton(
        onPressed: (widget.isLoading == false) ? widget.onPressed : null,
        color: Colors.black,
        child: Stack(children: [
          (widget.iconData != null)
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(widget.iconData),
                )
              : SizedBox(
                  height: 0,
                  width: 0,
                ),
          Align(
            alignment: Alignment.center,
            child: (widget.isLoading == false)
                ? Text(widget.text)
                : SizedBox(
                    child: CircularProgressIndicator(),
                    height: 20,
                    width: 20,
                  ),
          )
        ]),
      ),
    );
  }
}
