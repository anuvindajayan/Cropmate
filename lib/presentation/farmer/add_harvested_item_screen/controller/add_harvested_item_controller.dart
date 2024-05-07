import 'dart:io';

import 'package:cropmate/presentation/common/login_screen/view/login_screen.dart';
import 'package:cropmate/presentation/farmer/home_screen/view/home_screen.dart';
import 'package:cropmate/repository/api/common/registration_screen/service/registartion_screen_service.dart';
import 'package:flutter/material.dart';

import '../../../../repository/api/farmer/add_harvested_item/service/add_harvested_item_service.dart';

class AddHarvestedItemController extends ChangeNotifier {
  void onAdd({
    required String createdBy,
    required String cropType,
    required String cropName,
    required double price,
    required int quantity,
    required String description, required String isAvailable,
    // File? imageToAdd,
    // required String isAvailable,
    // required BuildContext context,
  }) {
    var data = {
      "crop_type": cropType,
      "crop_name": cropName,
      "price": price.toString(),
      "quantity": quantity.toString(),
      "description": description,
      "posted_by": createdBy,
      "is_available":isAvailable
      // "image":imageToAdd
    };
    /*
    var data =
    {
      "crop_type": "Vegetables",
      "crop_name": "new veg",
      "price": 40,
      "quantity": 15,
      "description": "tomatoos...sweet",
      "posted_by": "gigi"

    }
    ;
    */
    AddHarvestedItemService.postHarvestedData(data).then((decodedData) {
      // print("success i.e status ==1");
      if (decodedData["status"] == 1) {
        print("adding  success\n i.e status ==1");
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => HomeScreen()),
        //         (route) => false);
      } else {
        var message = "error in api";
        print(message);
        // AppUtils.oneTimeSnackBar(message, context: context);
      }
    });
  }
}
