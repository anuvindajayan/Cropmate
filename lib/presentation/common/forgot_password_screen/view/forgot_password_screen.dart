import 'package:cropmate/core/app_utils/app_utils.dart';
import 'package:cropmate/core/constants/color_constants.dart';
import 'package:cropmate/global_widgets/crop_mate_icon_widget.dart';
import 'package:cropmate/global_widgets/matterial_button_widget.dart';
import 'package:cropmate/global_widgets/textfield.dart';
import 'package:cropmate/presentation/common/forgot_password_screen/controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  var usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    var devWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(appBar: AppBar(
        elevation: 0,
        titleTextStyle: const TextStyle(
            color: ColorConstants.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w600),
        toolbarHeight: devWidth * .25,
        title:Text("Forget password"),

      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [SizedBox(height: devHeight*0.1,),
              CropMateIconWidget(),
              TextFieldScreen(
                hintText: "username",
                controller: usernameController,
              ),
              SizedBox(height: devHeight*0.02,),
              MaterialButtonWidget(
                onPressed: () {
                  Provider.of<ForgotPasswordController>(context,listen: false).onForgot(usernameController.text.trim(), context);
                  usernameController.clear();
                },
                buttonText: "Confirm",
                buttonColor: ColorConstants.primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
