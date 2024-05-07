/*
import 'dart:developer';

import 'package:cropmate/presentation/farmer/soil_analysis_Screen/view/widget/soil_analysis_result_screen.dart';
import 'package:cropmate/repository/api/farmer/soil_analysis_screen/service/soil_analysis_service.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_utils/app_utils.dart';

class SoilAnalysisController extends ChangeNotifier {
  String? message;
  void getSoilReport(
      {required BuildContext context,
      required int N,
      required int P,
      required int K,
      required double temp,
      required double humidity,
      required double pH,
      required double rain}) {
    var data = {
      "N": N.toString(),
      "P": P.toString(),
      "K": K.toString(),
      "temperature": temp.toString(),
      "humidity": humidity.toString(),
      "ph": pH.toString(),
      "rainfall": rain.toString(),
    };

    notifyListeners();
    SoilAnalysisService.getSoilAnalysis(data).then((decodedData) {
      // print("success i.e status ==1");
      if (decodedData["status"] == 1) {
        // var data=decodedData;
        // var message = data["data"];
        // log(message);
        // AppUtils.oneTimeSnackBar(message,
        //     context: context,
        //     bgColor: Colors.red,
        //     textStyle: TextStyle(color: Colors.white));
        showSoilAnalysisDialog(context: context, text: decodedData["data"]);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SoilAnalysisResultScreen(text: decodedData["data"])));
        print("Soil Analysis status ==9");
        message= decodedData["data"];
        // return decodedData.toString();

        // AppUtils.oneTimeSnackBar(decodedData["data"], context: context);
      } else {
        log(decodedData.toString());
        var message = "error in api";
        print(message);
      }
    });
  }

  showSoilAnalysisDialog({required BuildContext context, String? text}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(text!),
          );
        });
  }
}
 */
import 'dart:developer';

import 'package:cropmate/core/app_utils/app_utils.dart';
import 'package:cropmate/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

import '../../../../repository/api/farmer/soil_analysis_screen/service/soil_analysis_service.dart';
import '../../soil_analysis_result_screen/view/soil_analysis_result_screen.dart';

/*
class SoilAnalysisController extends ChangeNotifier {
  String? message;

  void getSoilReport(
      {required BuildContext context,
      required int N,
      required int P,
      required int K,
      required double temp,
      required double humidity,
      required double pH,
      required double rain}) {
    var data = {
      "N": N.toString(),
      "P": P.toString(),
      "K": K.toString(),
      "temperature": temp.toString(),
      "humidity": humidity.toString(),
      "ph": pH.toString(),
      "rainfall": rain.toString(),
    };

    SoilAnalysisService.getSoilAnalysis(data).then((decodedData) {
      // print("success i.e status ==1");
      if (decodedData["status"] == 1) {
        print("Soil Analysis status ==>>>>>>>>>>>>>>>>>");
        message = decodedData["data"];
        log(message.toString());
        return message.toString();
        // return decodedData;
      } else {
        log(decodedData.toString());
        var message = "error in api";
        print(message);
        return message;
      }
    });
  }
}


 */
/*
import 'dart:async';


class SoilAnalysisController extends ChangeNotifier {
  String? message;

  Future<String?> getSoilReport({
    required BuildContext context,
    required int N,
    required int P,
    required int K,
    required double temp,
    required double humidity,
    required double pH,
    required double rain,
  }) async {
    var data = {
      "N": N.toString(),
      "P": P.toString(),
      "K": K.toString(),
      "temperature": temp.toString(),
      "humidity": humidity.toString(),
      "ph": pH.toString(),
      "rainfall": rain.toString(),
    };

    try {
      var decodedData = await SoilAnalysisService.getSoilAnalysis(data);
      if (decodedData["status"] == 1) {
        print("Soil Analysis status ==>>>>>>>>>>>>>>>>> ${decodedData["status"]}");
        message = decodedData["data"];
        print(message);
        return message;
      } else {
        print(decodedData.toString());
        var errorMessage = "Error in API";
        print(errorMessage);
        return errorMessage;
      }
    } catch (e) {
      print("Error: $e");
      return null; // or return some default error message
    }
  }
}

 */
class SoilAnalysisController extends ChangeNotifier {
  String? message;

  Future<String?> getSoilReport({
    required BuildContext context,
    required int N,
    required int P,
    required int K,
    required double temp,
    required double humidity,
    required double pH,
    required double rain,
  }) async {
    var data = {
      "N": N.toString(),
      "P": P.toString(),
      "K": K.toString(),
      "temperature": temp.toString(),
      "humidity": humidity.toString(),
      "ph": pH.toString(),
      "rainfall": rain.toString(),
    };
    try {
      var decodedData = await SoilAnalysisService.getSoilAnalysis(data);

      // Check if the status is 1, indicating a successful response
      if (decodedData["status"] == 1) {
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>SoilAnalysisResultScreen(text: decodedData["data"]["The crop suitable for the condition"])));
        // If successful, set the message and display a snackbar with the result
        message = decodedData["data"]["The crop suitable for the condition"];
        AppUtils.oneTimeSnackBar(
            "The crop suitable for the condition:  ${message}",
            context: context,
            time: 5,
            bgColor: ColorConstants.primaryColor);

        return message;
      } else {
        // If the status is not 1, indicating an error response
        var errorMessage = "Error in API";
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
        return errorMessage;
      }
    } catch (e) {
      // Catch any exceptions that occur during the API call
      print("Error: $e");
      return null; // or return some default error message
    }
  }

/*
    try {
      var decodedData = await SoilAnalysisService.getSoilAnalysis(data);
      if (decodedData["status"] == 1) {
        print(
            "Soil Analysis status ==>>>>>>>>>>>>>>>>> ${decodedData["status"]}");
        message = decodedData["data"];
        print("kunna $message");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message ?? "myr"),
          ),
        );
        return message;
      } else {
        print(decodedData.toString());
        var errorMessage = "Error in API";
        print(errorMessage);
        return errorMessage;
      }
    } catch (e) {
      print("Error: $e");
      return null; // or return some default error message
    }
  }
*/
  // Getter method to access the message value
  String? get soilAnalysisMessage => message;
}
