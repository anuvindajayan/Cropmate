import 'package:cropmate/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/user_bottom_nav_screen_controller.dart';

class UserBottomNavScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    var mainProvider = Provider.of<UserBottomNavController>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              size: devHeight*0.03,
              color: ColorConstants.primaryColor,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: ColorConstants.iconColor,
              size: devHeight*0.03,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.qr_code_scanner_outlined,
              color: ColorConstants.primaryColor,
              size: devHeight*0.03,
            ),
            icon: Icon(Icons.qr_code_scanner_outlined,
                color: ColorConstants.iconColor, size: 25),
            label: "Scanner",
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person,
                color: ColorConstants.primaryColor,
                size: devHeight*0.03,
              ),
              icon: Icon(Icons.person_outline_outlined,
                color: ColorConstants.iconColor, size: devHeight*0.03,),
              label: "profile"),
        ],
        onTap: (index) {
          Provider.of<UserBottomNavController>(context, listen: false)
              .onTap(index, context);
        },
        currentIndex: mainProvider.selectedIndex,
        selectedItemColor: ColorConstants.primaryColor,
      ),
      body: mainProvider.myPages[mainProvider.selectedIndex],
    );
  }
}