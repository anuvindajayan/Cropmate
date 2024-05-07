import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../app_config/app_config.dart';

class ApiHelper {
  //for get
  static getData({
    required String endPoint,
    Map<String, String>? header,
  }) async {
    log("ApiHelper>getData");
    final url = Uri.parse(AppConfig.baseUrl + endPoint);
    try {
      var response = await http.get(url, headers: header);
      log("Api Called => status code=${response.statusCode}");
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        log(decodedData.toString());
        var data = {
          "data": decodedData,
          "status": 1,
        };
        return data;
      } else {
        log("Else Condition >> Api failed");
        var data = {
          "data": null,
          "status": 0,
        };
        return data;
      }
    } catch (e) {
      log("$e");
    }
  }

  //for post
  static Future postData(
      {
      //future added
      required String endPoint,
      Map<String, String>? header,
      required Map<String, dynamic> body,
      String? finalUrl}) async {
    log("Api-helper>postData 5");
    log("$body");

    final url = Uri.parse(AppConfig.baseUrl + endPoint);
    // final url = Uri.parse("http://10.11.0.236:8000/cropmapp/register/");
    //code from gpt
    log("Request URL: $url");
    try {
      final response = await http.post(url, body: body);
// After response
      log("Response Status Code: ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = response.body;
        var decodedData = jsonDecode(data);
        log(decodedData["status"].toString());
        return decodedData;
      } else {
        log("Else Condition -> Api failed");
        var data = response.body;
        var decodedData = jsonDecode(data);
        log(decodedData["status"].toString());
        return decodedData;
      }
    } catch (e) {
      var error = e.toString();
      log(">>>>>>>>>>>>: $error");
    }
  }

  //for delete
  static Future<Map<String, dynamic>> deleteData(
      {required String endPoint,
      Map<String, String>? header,
      Map<String, dynamic>? body}) async {
    Uri url = Uri.parse(AppConfig.baseUrl + endPoint);
    try {
      final response =
          await http.delete(url, headers: header, body: jsonEncode(body));
      //jsonEncode il body pass akeno

      return _handleResponse(response);
    } catch (e) {
      print("Error: $e");
      return _handleError(e);
    }
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      var decodedData = jsonDecode(response.body);
      return {
        "data": decodedData,
        "status": 1,
      };
    } else {
      print("API Error: ${response.statusCode}");
      return {
        "data": null,
        "status": 0,
      };
    }
  }

  static Map<String, dynamic> _handleError(dynamic error) {
    print("API Error: $error");
    return {
      "data": null,
      "status": 0,
    };
  }

/*
  gpt code
  import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  static final String baseUrl = "YOUR_BASE_URL_HERE"; // Update with your base URL

  static Future<Map<String, dynamic>> putData({
    required String endPoint,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  }) async {
    Uri url = Uri.parse(baseUrl + endPoint);
    try {
      final response = await http.put(url, body: jsonEncode(body), headers: header);
      return _handleResponse(response);
    } catch (e) {
      print("Error: $e");
      return _handleError(e);
    }
  }

  static Future<Map<String, dynamic>> deleteData({
    required String endPoint,
    Map<String, String>? header,
  }) async {
    Uri url = Uri.parse(baseUrl + endPoint);
    try {
      final response = await http.delete(url, headers: header);
      return _handleResponse(response);
    } catch (e) {
      print("Error: $e");
      return _handleError(e);
    }
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      var decodedData = jsonDecode(response.body);
      return {
        "data": decodedData,
        "status": 1,
      };
    } else {
      print("API Error: ${response.statusCode}");
      return {
        "data": null,
        "status": 0,
      };
    }
  }

  static Map<String, dynamic> _handleError(dynamic error) {
    print("API Error: $error");
    return {
      "data": null,
      "status": 0,
    };
  }
}

   */

/*sir's code
  static Future<APIResponse> deleteData({required String endPoint,
    required Map<String, String> header,
    required Map<String, dynamic> body}) async {
    if (await AppUtils.isOnline()) {
      // AppUtils().printData('$body');
      // AppUtils().printData('patch body above');
      try {
        final uri = Uri.parse(AppConfig.baseUrl + endPoint);
        AppUtils.logger.i(uri);

        // AppUtils.logger.i(uri);
        // print(header);
        final res =
        await http.delete(uri, headers: header, body: jsonEncode(body));

        if (isRequestSucceeded(res.statusCode)) {
          var resBody = json.decode(utf8.decode(res.bodyBytes));

          if (resBody['status'] == 1 || res.statusCode == 200) {
            if (resBody['msg'] != null) {
              AppUtils.oneTimeSnackBar(
                resBody['msg'] ?? "Success",
                context: AppConfigController.navigatorState.currentContext!,
              );
            }
            return APIResponse(data: resBody, error: false, errorMessage: '');
          } else {
            AppUtils.oneTimeSnackBar(
              resBody['msg'] ?? 'Something went wrong!',
              context: AppConfigController.navigatorState.currentContext!,
              bgColor: Colors.red,
            );
            return APIResponse(
                data: resBody,
                error: true,
                errorMessage:
                resBody['msg'].toString() ?? 'Something went wrong!');
          }
        } else {
          return APIResponse(
              data: res.body,
              error: true,
              errorMessage: 'Something went wrong!');
        }
      } catch (e) {
        return APIResponse(
            data: '', error: true, errorMessage: 'Could\'t reach server');
      }
    } else {
      if (AppConfigController.navigatorState.currentContext!.mounted) {
        await AppUtils.oneTimeSnackBar("No internet connection",
            bgColor: Colors.red,
            context: AppConfigController.navigatorState.currentContext!);
      }
      return APIResponse(
          data: '', error: true, errorMessage: 'Something went wrong!');
    }

 */
}
