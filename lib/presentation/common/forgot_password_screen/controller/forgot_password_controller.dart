import 'dart:developer';

import 'package:cropmate/core/app_utils/app_utils.dart';
import 'package:cropmate/presentation/common/login_screen/view/login_screen.dart';
import 'package:cropmate/repository/api/common/forgot_password_screen/service/forgot_password_screen_service.dart';
import 'package:flutter/material.dart';

class ForgotPasswordController extends ChangeNotifier {
  Future onForgot(String enteredUsername, BuildContext context) async {
    var data = {"username": enteredUsername};
    ForgotPasswordService.postForgotUsername(data).then((value) {
      log("onForgot ${value["msg"]}");
      if (value["msg"] == "New password sent successfully") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      } else {
        var message = value["msg"];
        AppUtils.oneTimeSnackBar(message, context: context);
      }
    });
  }
}
