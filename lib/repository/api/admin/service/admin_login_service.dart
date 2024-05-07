import 'dart:developer';

import '../../../helper/api_helper.dart';

class AdminLoginService {
  static Future<dynamic> postGetStartedData(Map<String, dynamic> data) async {
    try {
      var decodedData = await ApiHelper.postData(
          endPoint: "cropmapp/superuser-login/",
          body: data,
          // finalurl: 'http://10.11.0.164:8000/cropmapp/superuser-login/');
          finalUrl: 'http://10.11.0.164:8000/cropmapp/superuser-login/');

      log(decodedData.toString());
      if (decodedData["status"] == 1) {
        log("success in service class ");
        return decodedData;
      } else {
        log(decodedData["status"].toString());
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }
}
