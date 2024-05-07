import 'package:cropmate/presentation/common/plant%20_disease_prediction_screen/view/plant_disease_prediction_screen.dart';
import 'package:cropmate/presentation/user/user_harvested_item_screen/view/user_harvested_item_screen.dart';
import 'package:cropmate/presentation/user/user_profile_screen/view/user_profile_screen.dart';
import 'package:flutter/cupertino.dart';

class UserBottomNavController extends ChangeNotifier {
  int selectedIndex = 0;

  List<Widget> myPages = [
    UserHarvestedItemScreen(),
    PlantDiseasePredictionScreen(),
    UserProfileScreen()
  ];

  void onTap(index, context) {
    selectedIndex = index;
    notifyListeners();
  }
}
