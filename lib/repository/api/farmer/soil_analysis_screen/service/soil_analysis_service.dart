import 'dart:developer';

import '../../../../helper/api_helper.dart';

class SoilAnalysisService {
  static Future<dynamic> getSoilAnalysis(Map<String, dynamic> data) async {
    try {
      var decodedData = await ApiHelper.postData(
          endPoint: "cropmapp/crop-recommendation/",
          body: data,
          finalUrl: 'http://10.0.2.2:8000/cropmapp/crop-recommendation/');
      // finalurl: 'http://127.0.0.1:8000/cropmapp/register/');
      // finalurl: 'http://10.11.0.236:8000/cropmapp/register/');
      var message = decodedData["data"];
      log(decodedData.toString());
      if (decodedData["status"] == 1) {
        log(decodedData["status"].toString());
        log(">>>>>>>>>>>>>>>>>>> = $message");
        return decodedData;
      } else {
        // log(decodedData["status"].toString());
        // log(">>>>>>>>>>>>>>>>>>failed=>$message ");
        return decodedData;
      }
    } catch (e) {
      log("e is $e");
    }
  }
}
