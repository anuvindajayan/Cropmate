import 'package:cropmate/core/constants/color_constants.dart';
import 'package:cropmate/global_widgets/crop_mate_icon_widget.dart';
import 'package:cropmate/global_widgets/matterial_button_widget.dart';
import 'package:cropmate/global_widgets/textfield.dart';
import 'package:cropmate/presentation/common/registration_screen/controller/registration_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _selectedName = "User";
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var locationController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    var devWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Column(
              children: [
                CropMateIconWidget(),
                ListTile(
                  title: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: ColorConstants.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: devHeight * .03,
                    ),
                  ),
                ),
                TextFieldScreen(
                  hintText: "Name",
                  controller: nameController,
                ),
                TextFieldScreen(
                  hintText: "Email",
                  controller: emailController,
                ),
                TextFieldScreen(
                  hintText: "Phone number",
                  controller: phoneController,
                ),
                TextFieldScreen(
                  hintText: "Location",
                  controller: locationController,
                ),
                TextFieldScreen(
                  hintText: "Address",
                  maxLines: 3,
                  controller: addressController,
                ),
                TextFieldScreen(
                  hintText: "Password",
                  controller: passwordController,
                ),
                SizedBox(
                  height: devHeight * 0.020,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: devWidth * 0.1),
                  child: DropdownButton<String>(
                    value: _selectedName,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedName = newValue!;
                      });
                    },
                    items: <String>["User", "Farmer"].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),                  ),
                ),
                SizedBox(
                  height: devHeight * 0.02,
                ),
                MaterialButtonWidget(
                  onPressed: () {
                    Provider.of<RegistrationScreenController>(context,
                            listen: false)
                        .onRegister(
                      name: nameController.text,
                      email: emailController.text,
                      phoneNumber: phoneController.text,
                      location: locationController.text,
                      address: addressController.text,
                      password: passwordController.text,
                      userType: _selectedName,
                      context: context,
                    );
                    // print("api reg completed");
                  },
                  buttonText: "Register",
                  buttonColor: ColorConstants.primaryColor,
                ),
                SizedBox(
                  height: devHeight * 0.020,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
