import 'package:flutter/material.dart';

class PlantDiseaseResultScreen extends StatelessWidget {
  // const PlantDiseaseResultScreen({super.key});
  PlantDiseaseResultScreen({required this.className, required this.result});

  String? className;
  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plant Disease Prediction Result"),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Title: $className",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Align(alignment: Alignment.bottomLeft, child: Text("Solution",style: TextStyle(fontSize: 20),)),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("$result"),
            ),
          ],
        ),
      ),
    );
  }
}
