import 'package:cropmate/global_widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../global_widgets/crop_mate_icon_widget.dart';
import '../../../../global_widgets/matterial_button_widget.dart';

import '../controller/reset_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  var usernameController = TextEditingController();
  var currentPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    var devWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(appBar: AppBar(
        elevation: 0,
        titleTextStyle: const TextStyle(
            color: ColorConstants.blackColor,
            fontSize: 20,
            fontWeight: FontWeight.w600),
        toolbarHeight: devWidth * .25,
        title:Text("Reset password"),

      ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: devHeight*0.1,),
                CropMateIconWidget(),
          
                TextFieldScreen(
                  hintText: "Username",
                  controller: usernameController,
                ),
                TextFieldScreen(
                  hintText: "Current password",
                  controller: currentPasswordController,
                ),
                TextFieldScreen(
                  hintText: "New password",
                  controller: newPasswordController,
                ),
                SizedBox(height: devHeight*0.02),
                MaterialButtonWidget(
                  onPressed: () {
                    Provider.of<ResetPasswordController>(context, listen: false)
                        .onReset(
                            usernameController.text.trim(),
                            currentPasswordController.text.trim(),
                            newPasswordController.text.trim(),
                            context);
                    usernameController.clear();
                  },
                  buttonText: "Confirm",
                  buttonColor: ColorConstants.primaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
