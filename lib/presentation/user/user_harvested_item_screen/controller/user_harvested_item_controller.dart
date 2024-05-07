import 'dart:developer';

import 'package:cropmate/repository/api/user/user_harvested_item_screen/modal/user_harvested_item_screen_modal.dart';
import 'package:cropmate/repository/api/user/user_harvested_item_screen/service/user_harvested_item_screen_service.dart';
import 'package:flutter/cupertino.dart';

class UserHarvestedItemScreenController with ChangeNotifier {
  FarmerProductModal farmerProductModal= FarmerProductModal();// Initialize with an empty model

  bool isLoading = false;


  fetchProduct() async {
    isLoading = true;
    notifyListeners();
    try {
      var data = await UserHarvestedItemScreenService.getprodcutList();
      if (data != null) {
        farmerProductModal = FarmerProductModal.fromJson(data);
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
