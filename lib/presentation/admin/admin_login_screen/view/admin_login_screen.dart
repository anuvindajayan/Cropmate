import 'package:cropmate/core/constants/color_constants.dart';
import 'package:cropmate/global_widgets/crop_mate_icon_widget.dart';
import 'package:cropmate/global_widgets/matterial_button_widget.dart';
import 'package:cropmate/global_widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/admin_login_controller.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<AdminLoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(devHeight * .02),
        child: ListView(children: [
          Column(
            children: [
              CropMateIconWidget(), //refactored widget, stack oke used
              ListTile(
                leading: Text(
                  "Log in as Admin",
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
              // Align(
              //   alignment: Alignment.topRight,
              //   child: InkWell(
              //     onTap: () {},
              //     child: Text('Forgot Password?',
              //         style: TextStyle(
              //             fontSize: 16, color: ColorConstants.blackColor)),
              //   ),
              // ),
              SizedBox(
                height: 15,
              ),
              MaterialButtonWidget(
                onPressed: () {
                  Provider.of<AdminLoginController>(context, listen: false)
                      .onAdminLogin(
                          nameController.text, passController.text, context);
                  nameController.clear();
                  passController.clear();
                },
                buttonText: "Log in as Admin",
                buttonColor: ColorConstants.primaryColor,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
