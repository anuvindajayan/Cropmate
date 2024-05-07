import 'dart:developer';

import 'package:cropmate/repository/helper/api_helper.dart';

class ViewProfileService {
  static Future<dynamic> fetchProfile(id, header) async {
    log("service class started");
    try {
      var decodedData = await ApiHelper.getData(
          endPoint: "cropmapp/profile/$id", header: header);
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
