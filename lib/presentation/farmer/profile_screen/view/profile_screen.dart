import 'package:cropmate/core/constants/color_constants.dart';
import 'package:cropmate/global_widgets/farmer_widgets/Profile_listtile.dart';
import 'package:cropmate/presentation/common/login_screen/controller/login_screen_controller.dart';
import 'package:cropmate/presentation/common/reset_password_screen/view/reset_password_screen.dart';
import 'package:flutter/material.dart';

import '../../../common/govt_scheme_screen/view/govt_scheme_screen.dart';

import '../../../common/view_profile_screen/view/view_profile_screen.dart';
import '../../soil_analysis_Screen/view/soil_analysis_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: devHeight * 0.03,
          ),
          // Expanded(
          //   child: profilecard(text: text, actions: actions, icon: icon, devHeight: devHeight),
          // ),
          ProfileListTile(
            text: "View profile",
            icon: Icon(Icons.person),
            onTileClick: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ViewProfileScreen())),
          ),
          ProfileListTile(
            text: "Government schemes information",
            icon: Icon(Icons.view_agenda),
            onTileClick: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => GovtSchemeScreen())),
          ),
          ProfileListTile(
            text: "Soil Analysis and Crop Recommendation",
            icon: Icon(Icons.view_agenda),
            onTileClick: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SoilAnalysisScreen())),
          ),
          ProfileListTile(
            text: "Reset password",
            icon: Icon(Icons.lock),
            onTileClick: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ResetPasswordScreen())),
          ),
          // ProfileListTile(
          //   text: "Feedback",
          //   icon: Icon(Icons.feedback_rounded),
          //   onTileClick: () => Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => UpdateProfileScreen())),
          // ),
          ProfileListTile(
              text: "Logout",
              icon: Icon(Icons.logout),
              onTileClick: () => showLogoutBottomSheet(context)),
        ],
      ),
    );
  }

  void showLogoutBottomSheet(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    var devWidth = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: devWidth * 0.95,
          height: devHeight * 0.3,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Log out",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: devHeight * 0.03,
                      fontWeight: FontWeight.bold)),
              Text('Are you sure you want to Logout',
                  style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the BottomSheet
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        ColorConstants.primaryColor,
                      ),
                    ),
                    child: Text("Cancel",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      LoginScreenController().logout(context);
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        ColorConstants.primaryColor,
                      ),
                    ),
                    child: Text("Log out",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
