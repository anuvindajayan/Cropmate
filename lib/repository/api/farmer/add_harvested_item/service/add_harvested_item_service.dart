import 'dart:developer';

import '../../../../helper/api_helper.dart';

class AddHarvestedItemService {
  static Future<dynamic> postHarvestedData(Map<String, dynamic> data) async {
    try {
      var decodedData = await ApiHelper.postData(
          endPoint: "cropmapp/farmerproducts/",
          body: data,
          // finalurl: 'http://10.0.2.2:8000/cropmapp/farmerproducts/');
      // finalurl: 'http://127.0.0.1:8000/cropmapp/register/');
      finalUrl: 'http://10.11.0.164:8000/cropmapp/farmerproducts/');
      var message = decodedData["message"];
      log(decodedData.toString());
      if (decodedData["status"] == 1 ) {
        log(decodedData.toString());
        log("Services>postRegistrationData()>success = $message");
        return decodedData;
      } else {
        log(decodedData["status"]);
        log("RegistrationServices>postRegistrationData()>failed=>$message ");
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }
}
