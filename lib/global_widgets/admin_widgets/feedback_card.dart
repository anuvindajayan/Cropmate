import 'package:cropmate/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class FeedbackCard extends StatelessWidget {
  final String name;
  final String product;
  final String feedback;

  const FeedbackCard({
    super.key,
    required this.name,
    required this.product,
    required this.feedback,
  });

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: 12, right: 12, bottom: 4),
      child: SizedBox(
        height: devHeight * .14,
        child: Card(
            color: ColorConstants.lightGreenColor,
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(10),
              children: [
                Text('Name: $name'),
                Text('Product: $product'),
                Text('Feedback: $feedback')
              ],
            )),
      ),
    );
  }
}
