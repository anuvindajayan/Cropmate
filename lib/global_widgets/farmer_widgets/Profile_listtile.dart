import 'package:flutter/material.dart';

import '../../core/constants/color_constants.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTileClick,
  });

  final String text;
  final VoidCallback onTileClick;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ListTile(
        onTap: onTileClick,
        leading: icon,
        title: Text(text),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: ColorConstants.primaryColor,
        ),
      ),
    );
  }
}
