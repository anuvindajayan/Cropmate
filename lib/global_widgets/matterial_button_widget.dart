import 'dart:io';

import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final File? img;

  MaterialButtonWidget(
      {super.key, this.buttonText, this.buttonColor, this.onPressed, this.img});

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    var devWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        height: devHeight * .06,
        minWidth: devWidth,
        color: buttonColor,
        onPressed: onPressed,
        child: Text(
          buttonText!,
          style: TextStyle(fontSize: devHeight * .03, color: Colors.white),
        ),
      ),
    );
  }
}
