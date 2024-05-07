import 'dart:convert';
import 'dart:developer';

import 'package:cropmate/app_config/app_config.dart';
import 'package:cropmate/core/app_utils/app_utils.dart';
import 'package:cropmate/repository/api/common/view_profile_screen/model/profile_model.dart';
import 'package:cropmate/repository/api/common/view_profile_screen/service/view_profile_Service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewProfileController extends ChangeNotifier {
  late ProfileModel profileModel = ProfileModel();
  late SharedPreferences prefs;

  bool isLoading = false;
  late Map<String, dynamic> userData;

  fetchProfileData(context) async {
    isLoading = true;
    notifyListeners();
    log("profile controller  fetchProfile started");
    fetchProfileDetails().then((value) {
      userData = jsonDecode(value!);
      var uId = userData["data"]["id"];
      Map<String, String> header = {
        'authorization': 'token ${userData["token"]}'
      };
      log("id=$uId");
      log("$header");
      ViewProfileService.fetchProfile(uId, header).then((value) {
        log("statuss${value["status"]}");
        if (value["status"] == 1) {
          profileModel = ProfileModel.fromJson(value["data"]);
          isLoading = false;
          notifyListeners();
        } else {
          AppUtils.oneTimeSnackBar("view failed", context: context);
        }
      });
      notifyListeners();
    });
  }


  Future<String?> fetchProfileDetails() async {
    prefs = await SharedPreferences.getInstance();
    var data = prefs.getString(AppConfig.profileData);
    log("profile controller shared preference ");
    return data;
  }
}
