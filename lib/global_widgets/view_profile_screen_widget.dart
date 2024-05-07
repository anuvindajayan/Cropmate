import 'package:cropmate/core/constants/color_constants.dart';
import 'package:flutter/material.dart';


class ViewProfileWidget extends StatelessWidget {
  final String id;
  final String value;
  // final String email;
  // final VoidCallback onCardClick;

  const ViewProfileWidget({
    super.key,
    required this.value, required this.id,
    // required this.email,
    // required this.onCardClick,
  });

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: 12, right: 12, bottom: 4),
      child: SizedBox(
        height: devHeight * .11,
        child: Card(
          color: ColorConstants.lightGreenColor,
          child: ListTile(
            // onTap: onCardClick,
            title: Row(
              children: [
                Text(id),
                Text('$value'),
              ],
            ),
            // subtitle: Text('Ph No: $email'),
          ),
        ),
      ),
    );
  }
}
