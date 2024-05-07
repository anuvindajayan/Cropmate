/*
import 'dart:io';

import 'package:cropmate/repository/api/admin/agr_eqp_management/service/agr_eqp_management_service.dart';
import 'package:flutter/material.dart';

class AgrEqpAddController extends ChangeNotifier {
  void onEqpAdd(
      {required String eqpName,
      required String price,
      required String quantity,
      required String brand,
      required String isAvail,
        File? image
      // required String link,
      }) {
    var data = {
      "equipment_name": eqpName,
      "price": price,
      "qty": quantity,
      "Brand": brand,
      "is_available": isAvail,
      "image": image

      // "link": link,
    };
    AgrEqpManagementService.postEqp(data).then((decodedData) {
      print("success i.e status ==1");
      if (decodedData["status"] == 1) {
        print("Equipment Added Successfully");
      } else {
        var message = "error in api";
        print(message);
        // AppUtils.oneTimeSnackBar(message, context: context);
      }
    });
  }
}


 */

import 'dart:convert';
import 'dart:io';

import 'package:cropmate/app_config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../../repository/api/admin/agr_eqp_management/service/agr_eqp_management_service.dart';

/*
class AgrEqpAddController extends ChangeNotifier {
  Future<void> onEqpAdd({
    required String eqpName,
    required String price,
    required String quantity,
    required String brand,
    required String isAvail,
    required File? image, // Pass image file
  }) async {
    try {
      // Upload image
      var imageUrl = "http://10.11.0.227:8000/cropmapp/equipmentadd/";
      var response = await onUploadImage(imageUrl, image);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Extract image URL from response if needed

        var imageUrl = ""; // Default to empty string
        print('Image upload successful 11111');

        imageUrl = json.decode(response.body)["image"];

        // Add equipment data with image URL (or any other relevant data)
        var data = {
          "equipment_name": eqpName,
          "price": price,
          "qty": quantity,
          "Brand": brand,
          "is_available": isAvail,
          "image": imageUrl, // Use imageUrl if you extracted it
        };

        // Call API to add equipment
        var decodedData = await AgrEqpManagementService.postEqp(data);

        if (decodedData["status"] == 1) {
          // Equipment added successfully
          print("Equipment Added Successfully");
        } else {
          // Handle error in API response
          var message = "Error in API";
          print(message);
        }
      } else {
        // Image upload failed
        // Handle error
        print("Image upload failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      // Handle any exceptions
      print("Error occurred: $e");
    }
  }

  Future<http.Response> onUploadImage(String url, File? selectedImage) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {"Content-type": "multipart/form-data"};

    if (selectedImage != null) {
      print("Image file size: ${selectedImage.lengthSync()} bytes <<<<<<<<<<<");
      request.files.add(
        http.MultipartFile(
          'image',
          selectedImage.readAsBytes().asStream(),
          selectedImage.lengthSync(),
          filename: selectedImage.path.split('/').last,
        ),
      );
    }

    request.headers.addAll(headers);
    print("request: " + request.toString());
    var res = await request.send();
    return await http.Response.fromStream(res);
  }
}
*/
class AgrEqpAddController extends ChangeNotifier {
  Future<void> onEqpAdd({
    required String eqpName,
    required String price,
    required String quantity,
    required String brand,
    required String isAvail,
    required File? image, // Pass image file
  }) async {
    try {
      // Upload image
      var imageUrl = "http://10.11.0.227:8000/cropmapp/equipmentadd/";
      var response = await onUploadImage(
          imageUrl, image, eqpName, price, quantity, brand, isAvail);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Extract image URL from response if needed

        // imageUrl = json.decode(response.body)["image"];

        // Add equipment data with image URL (or any other relevant data)
        var imageUrlFromServer = json.decode(response.body)["image"];
        var data = {
          "equipment_name": eqpName,
          "price": price,
          "qty": quantity,
          "Brand": brand,
          "is_available": isAvail,
          "image": imageUrlFromServer,
        };

        // Call API to add equipment
        var decodedData = await AgrEqpManagementService.postEqp(data);

        if (decodedData["status"] == 1) {
          // Equipment added successfully
          print("Equipment Added Successfully");
          // print(" iiiifffff${response.body}");
          // return decodedData;
        } else {
          // Handle error in API response
          var message = "Error in API";
          print(message);
          // print("elseeeeeee${response.body}");
          // return decodedData;
        }
      } else {
        // Image upload failed
        // Handle error
        print(
            "Image upload failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      // Handle any exceptions
      print("Error occurred: $e");
    }
  }

  Future<http.Response> onUploadImage(
      String url,
      File? selectedImage,
      String eqpName,
      String price,
      String quantity,
      String brand,
      String isAvail) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {"Content-type": "multipart/form-data"};

    if (selectedImage != null) {
      print("Image file size: ${selectedImage.lengthSync()} bytes <<<<<<<<<<<");
      // var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add image file to the request
      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          selectedImage.path,
        ),
      );
    }


    if (brand != null) {
      request.fields['Brand'] = brand;
    }
    if (eqpName != null) {
      request.fields['eqipment_name'] = eqpName;
    }
    if (price != null) {
      request.fields['price'] = price;
    }
    if (quantity != null) {
      request.fields['qty'] = quantity;
    }
    // if (description != null) {
    //   request.fields['description'] = description;
    // }
    request.fields['is_available'] = isAvail;


    request.headers.addAll(headers);
    print("request: " + request.toString());
    var res = await request.send();
    return await http.Response.fromStream(res);
  }
}

/*
  Future<void> onEqpAdd({
    required String eqpName,
    required String price,
    required String quantity,
    required String brand,
    required String isAvail,
    required File? image, // Pass image file
  }) async {
    try {
      // Upload image
      var imageUrl = "http://10.11.0.227:8000/cropmapp/equipmentadd/";
      var response = await onUploadImage(imageUrl, image, eqpName, price, quantity, brand, isAvail);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Handle success response
        print("Upload successful");
        print("iiiiiiiiffffffff${response.body}");
      } else {
        // Handle failure response
        print("Upload failed with status code: ${response.statusCode}");
        print("elseeeeeee${response.body}");

      }
    } catch (e) {
      // Handle any exceptions
      print("Error occurred: $e");
    }
  }
*/