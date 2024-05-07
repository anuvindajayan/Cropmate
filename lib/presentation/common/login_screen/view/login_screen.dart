import 'dart:math';

import 'package:cropmate/core/constants/color_constants.dart';
import 'package:cropmate/presentation/admin/admin_login_screen/view/admin_login_screen.dart';
import 'package:cropmate/presentation/common/forgot_password_screen/view/forgot_password_screen.dart';
import 'package:cropmate/presentation/common/login_screen/controller/login_screen_controller.dart';
import 'package:cropmate/global_widgets/crop_mate_icon_widget.dart';
import 'package:cropmate/global_widgets/matterial_button_widget.dart';
import 'package:cropmate/global_widgets/textfield.dart';
import 'package:cropmate/repository/api/admin/service/admin_login_service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../admin/home_screen/view/home_screen.dart';
import '../../registration_screen/view/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(actions: [
        PopupMenuButton(
            itemBuilder: ((context) => [
                  PopupMenuItem(
                      onTap: () {
                        checkTokenAndNavigate(context);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => AdminLoginScreen()));
                      },
                      child: Text('Login as Admin'))
                ]))
      ]),
      body: Padding(
        padding: EdgeInsets.all(devHeight * .02),
        child: ListView(children: [
          Column(
            children: [
              CropMateIconWidget(), //refactored widget, stack oke used
              ListTile(
                leading: Text(
                  "Log in",
                  style: TextStyle(
                      color: ColorConstants.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: devHeight * .034),
                ),
              ),
              TextFieldScreen(
                hintText: "Name",
                controller: nameController,
              ),
              TextFieldScreen(
                hintText: "Password",
                controller: passController,
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPasswordScreen()));
                  },
                  child: Text('Forgot Password?',
                      style: TextStyle(
                          fontSize: 16, color: ColorConstants.blackColor)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              MaterialButtonWidget(
                onPressed: () {
                  Provider.of<LoginScreenController>(context, listen: false)
                      .onLogin(
                          nameController.text, passController.text, context);
                  nameController.clear();
                  passController.clear();
                  print('Success1');
                },
                buttonText: "Log in",
                buttonColor: ColorConstants.primaryColor,
              ),
              Align(
                heightFactor: devHeight * .01,
                alignment: Alignment.bottomCenter,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: ColorConstants.blackColor, fontSize: 16),
                    children: [
                      TextSpan(
                        text: "Don't Have an Account?\t",
                        style: TextStyle(letterSpacing: .5),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    RegistrationScreen()));
                          },
                          child: Text(
                            '\tCreate Account',
                            style: TextStyle(
                                color: ColorConstants.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: .3),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Future<void> checkTokenAndNavigate(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      // Token exists, navigate to HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // Token doesn't exist, navigate to AdminLoginScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AdminLoginScreen()),
      );
    }
  }
}
