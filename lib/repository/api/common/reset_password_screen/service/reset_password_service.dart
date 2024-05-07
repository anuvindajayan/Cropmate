import 'dart:developer';

import 'package:cropmate/repository/helper/api_helper.dart';

class ResetPasswordService {
  static Future<dynamic> postResetPassword(Map<String, String> data) async {
    try {
      var decodedData = await ApiHelper.postData(
          endPoint: "cropmapp/reset-password/", body: data);
      var message = decodedData["msg"];
      if (decodedData["msg"] == "Password reset successfully") {
        log(" password reset service() success =? $message");
        return decodedData;
      } else {
        log(" password reset service() failed => $message");
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }
}
