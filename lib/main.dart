import 'package:cropmate/presentation/admin/admin_login_screen/controller/admin_login_controller.dart';
import 'package:cropmate/presentation/admin/agr_eqp_management_screen/controller/agr_eqp_management_controller.dart';
import 'package:cropmate/presentation/admin/govt_scheme_management_screen/controller/govt_scheme_management_controller.dart';
import 'package:cropmate/presentation/common/forgot_password_screen/controller/forgot_password_controller.dart';
import 'package:cropmate/presentation/common/govt_scheme_screen/controller/govt_scheme_controller.dart';
import 'package:cropmate/presentation/admin/user_management_screen/controller/user_management_controller.dart';
import 'package:cropmate/presentation/common/login_screen/controller/login_screen_controller.dart';
import 'package:cropmate/presentation/common/login_screen/view/login_screen.dart';
import 'package:cropmate/presentation/common/reset_password_screen/controller/reset_password_controller.dart';
import 'package:cropmate/presentation/common/splash_screen/view/splash_screen.dart';
import 'package:cropmate/presentation/common/view_profile_screen/controller/view_profile_controller.dart';
import 'package:cropmate/presentation/farmer/add_harvested_item_screen/controller/add_harvested_item_controller.dart';
import 'package:cropmate/presentation/farmer/bottom_navigation_screen/controller/bottom_navigation_controller.dart';
import 'package:cropmate/presentation/farmer/bottom_navigation_screen/view/bottom_navigation_screen.dart';
import 'package:cropmate/presentation/farmer/home_screen/controller/Home_screen_controller.dart';
import 'package:cropmate/presentation/farmer/soil_analysis_Screen/controller/soil_analysis_controller.dart';
import 'package:cropmate/presentation/user/user_bottom_navigation_screen/controller/user_bottom_nav_screen_controller.dart';
import 'package:cropmate/presentation/user/user_bottom_navigation_screen/view/user_bottom_nav_screen.dart';
import 'package:cropmate/presentation/user/user_harvested_item_screen/controller/user_harvested_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/common/registration_screen/controller/registration_screen_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => BottomNavigationController()),
        ChangeNotifierProvider(
          create: (context) => UserBottomNavController(),
        ),
        ChangeNotifierProvider(
          create: (context) => FarmerHomeScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserHarvestedItemScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegistrationScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdminLoginController(),
        ),
        ChangeNotifierProvider(
          create: (context) => GovtSchemeController(),
        ),
        ChangeNotifierProvider(create: (context) => UserManagementController()),
        ChangeNotifierProvider(
            create: (context) => GovtSchemeManagementController()),
        ChangeNotifierProvider(create: (context) => AgrEqpAddController()),
        ChangeNotifierProvider(create: (context) => SoilAnalysisController()),
        ChangeNotifierProvider(create: (context) => AddHarvestedItemController()),
        ChangeNotifierProvider(create: (context)=> ViewProfileController()),
        ChangeNotifierProvider(create: (context)=> ForgotPasswordController()),
        ChangeNotifierProvider(create: (context)=> ResetPasswordController())

      ],
      child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
