import 'dart:developer';

import 'package:cropmate/repository/api/admin/user_management/model/user_management_model.dart';
import 'package:cropmate/repository/api/admin/user_management/service/user_management_service.dart';
import 'package:flutter/material.dart';

class UserManagementController with ChangeNotifier {
  UserManage userManage = UserManage();
  bool isLoading = false;

  fetchUserList() async {
    isLoading = true;
    notifyListeners();
    try {
      var data = await UserManageService.getUserList();
      if (data != null) {
        userManage = UserManage.fromJson(data);
      } else {
        log('Failed to fetch user list');
      }
    } catch (e) {
      log('Error fetching user list $e');
    } finally {
      isLoading = false;
      notifyListeners();
      print('finally working');
    }
  }
}
