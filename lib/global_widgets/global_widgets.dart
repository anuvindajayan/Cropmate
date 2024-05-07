import 'package:cropmate/global_widgets/textfield.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Some(),
  ));
}

class Some extends StatelessWidget {
  const Some({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextFieldScreen(hintText: "")
    );
  }
}
