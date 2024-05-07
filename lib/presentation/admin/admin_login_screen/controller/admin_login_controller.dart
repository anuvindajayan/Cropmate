import 'dart:convert';
import 'package:cropmate/presentation/admin/home_screen/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_utils/app_utils.dart';
import '../../../../repository/api/admin/service/admin_login_service.dart';
import '../../../common/login_screen/view/login_screen.dart';


class AdminLoginController extends ChangeNotifier {
  void onAdminLogin(String name, String pass, BuildContext context) {
    var data = {"username": name, "password": pass};
    AdminLoginService.postGetStartedData(data).then((decodedData) {
      print("success");
      if (decodedData["status"] == 1) {
        print("login success i.e status == 1 ");

        // Save token to SharedPreferences
        saveAdminTokenToPrefs(decodedData['token']);

        // Navigate to HomeScreen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        var message = "Login Failed";
        AppUtils.oneTimeSnackBar(message, context: context);
      }
    });
  }

  // Function to save token to SharedPreferences
  Future<void> saveAdminTokenToPrefs(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  // Function to clear token from SharedPreferences (Logout)
  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
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
