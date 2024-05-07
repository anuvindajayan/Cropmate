import 'dart:developer';

import '../../../../helper/api_helper.dart';

class AgrEqpManagementService {
  // static Future<dynamic> postGovtScheme(List<Map> data) async {
  static Future<dynamic> postEqp(Map<String, dynamic> data) async {
    try {
      var decodedData = await ApiHelper.postData(
          endPoint: "cropmapp/equipmentadd/",
          body: data,
          // finalurl: 'http://10.0.2.2:8000/cropmapp/equipmentadd/');
          finalUrl: 'http://10.11.0.164:8000/cropmapp/equipmentadd/');
      log(decodedData.toString());
      if (decodedData["status"] == 1) {
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
