import 'package:flutter/material.dart';

class SoilAnalysisResultScreen extends StatelessWidget {
  const SoilAnalysisResultScreen({super.key, required this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(text!),),

    );
  }
}
