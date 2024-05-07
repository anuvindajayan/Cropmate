import 'dart:developer';

import 'package:cropmate/core/app_utils/app_utils.dart';
import 'package:cropmate/core/constants/color_constants.dart';

import 'package:flutter/material.dart';

import '../../../../repository/api/common/reset_password_screen/service/reset_password_service.dart';

class ResetPasswordController extends ChangeNotifier {
  Future onReset(String enteredUsername, String currentPassword,
      String newPassword, BuildContext context) async {
    var data = {"username": enteredUsername,"otp":currentPassword,"new_password":newPassword};
    ResetPasswordService.postResetPassword(data).then((value) {
      log("onReset ${value["msg"]}");
      if (value["msg"] == "Password reset successfully") {
        AppUtils.oneTimeSnackBar(value["msg"], context: context);
        Navigator.pop(context);
      } else {
        var message = value["msg"];
        AppUtils.oneTimeSnackBar(message, context: context);
      }
    });
  }
}
