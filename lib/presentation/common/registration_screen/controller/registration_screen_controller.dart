
import 'package:cropmate/presentation/common/login_screen/view/login_screen.dart';
import 'package:cropmate/repository/api/common/registration_screen/service/registartion_screen_service.dart';
import 'package:flutter/material.dart';

class RegistrationScreenController extends ChangeNotifier {
  void onRegister(
      {required String name,
      required String email,
      required String phoneNumber,
      required String location,
      required String address,
      required String password,
      required String userType,
      required BuildContext context})  {
    var data = {
      "username": name,
      "email": email,
      "user_type": userType,
      "phone": phoneNumber,
      "address": address,
      "location": location,
      "password": password,
    };
    RegistrationService.postRegistrationData(data).then((decodedData) {
      // print("success i.e status ==1");
      if (decodedData["status"] == 1) {
        print("Registration  success\n i.e status ==1");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      } else {
        var message = "error in api";
        print(message);
        // AppUtils.oneTimeSnackBar(message, context: context);
      }
    });
  }
}


