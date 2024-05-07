import 'dart:developer';
import '../../../../helper/api_helper.dart';

class GovtSchemeService {
  static Future<dynamic> getGovtSchemes() async {
    try {
      var decodedData =
          await ApiHelper.getData(endPoint: "cropmapp/allschemeview/");
      log(decodedData.toString());
      if (decodedData["status"] == 1) {
        log("Data fetched successfully");
        return decodedData["data"];
      } else {
        log("Failed to fetch data: ${decodedData["status"]}");
        return null;
      }
    } catch (e) {
      log("Error fetching data: $e");
      return null;
    }
  }
}
