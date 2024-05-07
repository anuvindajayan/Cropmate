import 'package:flutter/material.dart';

import '../core/constants/color_constants.dart';
import '../core/constants/image_constants.dart';


class CropMateIconWidget extends StatelessWidget {
  const CropMateIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final devHeight = MediaQuery.of(context).size.height;
    final devWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        SizedBox(
          height: devHeight * 0.2,
          width: devWidth * 0.2,
          child: Image.asset(ImageConstants.appIcon),
        ),
        Positioned(
          bottom: devHeight * 0.05,
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: ColorConstants.blackColor,
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: "\tCrop",
                  style: TextStyle(letterSpacing: 0.5),
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Text(
                    'Mate',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: ColorConstants.redColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
