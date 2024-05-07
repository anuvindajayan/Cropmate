import 'dart:developer';

import 'package:cropmate/repository/helper/api_helper.dart';

class ForgotPasswordService {
  static Future<dynamic> postForgotUsername(Map<String, String> data) async {
    try {
      var decodedData = await ApiHelper.postData(
          endPoint: "cropmapp/forgot-password/", body: data);
      var message = decodedData["msg"];
      if (decodedData["msg"] == "New password sent successfully") {
        log("forgot password service() success =? $message");
        return decodedData;
      } else {
        log("forgot password service() failed => $message");
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }
}
