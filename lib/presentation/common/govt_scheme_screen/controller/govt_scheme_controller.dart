import 'dart:developer';



import 'package:cropmate/repository/api/common/govt_scheme_screen/service/govt_scheme_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../repository/api/common/govt_scheme_screen/model/govt_scheme_model.dart';
import '../../../../repository/api/common/govt_scheme_screen/service/govt_scheme_service.dart';

class GovtSchemeController with ChangeNotifier {
  late GovtSchemeModel govtSchemeModel;

  bool isLoading = false;
  void fetchGovtSchemes() async {
    isLoading = true;
    notifyListeners();
    try {
      var data = await GovtSchemeService.getGovtSchemes();
      if (data != null) {
        govtSchemeModel = GovtSchemeModel.fromJson(data);
      } else {
        log('Failed to fetch government schemes');
      }
    } catch (e) {
      log('Error fetching government schemes: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  Future<void> launchURL(String url) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
    notifyListeners();
  }
// added to check in admin side

  // void removeScheme(int index) {
  //   if (govtSchemeModel.data != null && govtSchemeModel.data!.isNotEmpty) {
  //     govtSchemeModel.data!.removeAt(index);
  //     notifyListeners();
  //   }
  // }

}
