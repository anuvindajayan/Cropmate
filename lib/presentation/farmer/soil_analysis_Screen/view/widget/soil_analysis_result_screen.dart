import 'package:cropmate/presentation/farmer/soil_analysis_Screen/controller/soil_analysis_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SoilAnalysisResultScreen extends StatefulWidget {
  const SoilAnalysisResultScreen({super.key, required this.text});
  final String text;

  @override
  State<SoilAnalysisResultScreen> createState() => _SoilAnalysisResultScreenState();
}

class _SoilAnalysisResultScreenState extends State<SoilAnalysisResultScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.text)),
    );
  }
}
