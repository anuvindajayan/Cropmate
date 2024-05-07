import 'package:cropmate/presentation/farmer/home_screen/view/home_screen.dart';
import 'package:flutter/material.dart';


import '../../../common/plant _disease_prediction_screen/view/plant_disease_prediction_screen.dart';
import '../../add_harvested_item_screen/view/add_harvested_item_screen.dart';

import '../../profile_screen/view/profile_screen.dart';

class BottomNavigationController extends ChangeNotifier {
  int selectedIndex = 0;

   List<Widget>myPages=[  HomeScreen(), AddHarvestedItemScreen(), PlantDiseasePredictionScreen(), ProfileScreen()];
  void onTap(index, context) {
    selectedIndex = index;
    notifyListeners();
  }
}
