import 'dart:developer';

import 'package:cropmate/repository/api/farmer/home_screen/model/home_screen_model.dart';
import 'package:cropmate/repository/api/farmer/home_screen/service/home_screen_service.dart';
import 'package:flutter/material.dart';

class FarmerHomeScreenController with ChangeNotifier {
  EquipmentListModel equipmentListModel = EquipmentListModel(); // Initialize with an empty model

  bool isLoading = false;

  fetchEqpList() async {
    isLoading = true;
    notifyListeners();
    try {
      var data = await FarmerHomeScreenService.getEqipList();
      if (data != null) {
        equipmentListModel = EquipmentListModel.fromJson(data);
      } else {
        log('Failed to fetch equipment list');
      }
    } catch (e) {
      log('Error fetching equipment list $e');
    } finally {
      isLoading = false;
      notifyListeners();
      print('finally working');
    }
  }
}
