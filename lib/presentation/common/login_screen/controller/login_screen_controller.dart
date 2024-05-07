import 'dart:convert'; // Required for JSON decoding
import 'package:cropmate/app_config/app_config.dart';
import 'package:cropmate/presentation/admin/home_screen/view/home_screen.dart';
import 'package:cropmate/presentation/common/login_screen/view/login_screen.dart';
import 'package:cropmate/presentation/farmer/bottom_navigation_screen/view/bottom_navigation_screen.dart';
import 'package:cropmate/presentation/user/user_bottom_navigation_screen/view/user_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_utils/app_utils.dart';
import '../../../../repository/api/common/login_screen/service/login_screen_service.dart';

class LoginScreenController extends ChangeNotifier {
  // Function to handle user login
  Future<void> onLogin(String name, String pass, BuildContext context) async {
    var data = {"username": name, "password": pass};

    try {
      // Make the API call to get login data
      var decodedData = await LoginScreenService.postGetStartedData(data);

      // Save decodedData and token to SharedPreferences
      await saveDataToPrefs(decodedData);

      // Extract user_type from decodedData
      String userType = decodedData['data']['user_type'];

      // Navigate based on user_type
      if (userType.toLowerCase() == 'user') {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => UserBottomNavScreen()));
      } else if (userType.toLowerCase() == 'farmer') {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => BottomNavigationScreen()));
      } else {
        // Handle unknown user type
        var message = "Unknown user type";
        AppUtils.oneTimeSnackBar(message, context: context);
      }
    } catch (e) {
      // Handle API call errors
      var message = "Login Failed";
      AppUtils.oneTimeSnackBar(message, context: context);
    }
  }

  // Function to save decodedData and token to SharedPreferences
  Future<void> saveDataToPrefs(Map<String, dynamic> decodedData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConfig.profileData, jsonEncode(decodedData));
    await prefs.setString('token', decodedData['token']);
  }

  // Function to clear token from SharedPreferences (Logout)
  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConfig.profileData);
    await prefs.remove('token');
    print(prefs.toString());
    // Navigate to login screen (Assuming you have a login screen as the root)
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }
}


