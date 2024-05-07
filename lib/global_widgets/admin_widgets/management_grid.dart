import 'package:flutter/material.dart';

class ManagementGrid extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback? onGridTapped;

  const ManagementGrid({
    Key? key,
    required this.imagePath,
    required this.title,
    this.onGridTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onGridTapped,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          padding: EdgeInsets.all(6.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Text(
                'Management',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
